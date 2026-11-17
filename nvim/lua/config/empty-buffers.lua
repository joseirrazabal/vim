-- Limpia automáticamente los buffers y pestañas vacíos que ya no se usan.
-- Casos típicos:
--   * el buffer "[No Name]" con el que arranca nvim y que bufferline muestra como pestaña
--   * la pestaña vacía que queda al abrir un archivo desde neo-tree con "t"

local group = vim.api.nvim_create_augroup("EmptyScratchCleanup", { clear = true })

-- ¿Es un buffer vacío, sin nombre, normal y sin cambios pendientes?
local function is_empty_scratch(buf)
	return vim.api.nvim_buf_is_valid(buf)
		and vim.api.nvim_buf_is_loaded(buf)
		and vim.api.nvim_buf_get_name(buf) == ""
		and vim.bo[buf].buftype == ""
		and not vim.bo[buf].modified
end

-- ¿Se está mostrando ese buffer en alguna ventana?
local function is_visible(buf)
	return #vim.fn.win_findbuf(buf) > 0
end

local busy = false

local function cleanup()
	if busy then
		return
	end
	busy = true

	local cur = vim.api.nvim_get_current_buf()

	-- 1) Si el buffer actual es un vacío, que se borre solo al salir de él
	if is_empty_scratch(cur) then
		vim.bo[cur].bufhidden = "wipe"
	end

	-- 2) Borra buffers vacíos que ya no están en ninguna ventana (escondidos)
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= cur and is_empty_scratch(buf) and not is_visible(buf) then
			pcall(vim.api.nvim_buf_delete, buf, { force = false })
		end
	end

	-- 3) Cierra pestañas que solo contengan un buffer vacío sin cambios
	local cur_tab = vim.api.nvim_get_current_tabpage()
	local to_close = {}
	for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
		if tab ~= cur_tab and #vim.api.nvim_tabpage_list_wins(tab) == 1 then
			local win = vim.api.nvim_tabpage_get_win(tab)
			local buf = vim.api.nvim_win_get_buf(win)
			if is_empty_scratch(buf) then
				table.insert(to_close, vim.api.nvim_tabpage_get_number(tab))
			end
		end
	end
	-- De mayor a menor para que los números no se desplacen al cerrar
	table.sort(to_close, function(a, b)
		return a > b
	end)
	for _, nr in ipairs(to_close) do
		pcall(vim.cmd, "tabclose " .. nr)
	end

	busy = false
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "TabEnter" }, {
	group = group,
	callback = function()
		-- diferido: borrar buffers/pestañas dentro del propio evento puede ser problemático
		vim.schedule(cleanup)
	end,
	desc = "Cerrar buffers y pestañas vacíos sin usar",
})
