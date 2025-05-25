local map = vim.keymap.set

-- para que el cursor cambie mas rapido al cambiar de modo
vim.opt.timeoutlen = 200 -- Reducir a 300 ms

vim.filetype.add({
	extension = {
		http = "http",
	},
})

-- Mover hacia abajo 5 líneas y mantener la misma columna
map({ "n", "v" }, "<S-J>", "5j", { noremap = true, silent = true })
-- Mover hacia arriba 5 líneas y mantener la misma columna
map({ "n", "v" }, "<S-K>", "5k", { noremap = true, silent = true })

-- Mover al final de la línea con Shift+L
map({ "n", "v" }, "<S-L>", "$", { noremap = true, silent = true })

local function toggle_line_start()
	-- Obtener la posición actual del cursor (fila, columna)
	local col = vim.fn.col(".")

	if col == 1 then
		-- Si ya estamos en la columna 0, mover al primer carácter no vacío (^)
		vim.cmd("normal! ^")
	else
		-- Si no estamos en la columna 0, mover a la columna 0
		vim.cmd("normal! 0")
	end
end

-- Mapeo para Shift+H (mover al inicio de la línea o al primer carácter)
map("n", "<S-H>", toggle_line_start, { noremap = true, silent = true })

-- Al buscar, centra la vista
map("n", "n", "nzzzv", { noremap = true })
map("n", "N", "Nzzzv", { noremap = true })

-- Reemplazar ':q' con ':Q' para evitar cerrar buffers con cambios sin guardar
vim.api.nvim_create_user_command("Q", function()
	local bufnr = vim.api.nvim_get_current_buf()
	if vim.api.nvim_buf_get_option(bufnr, "modified") then
		vim.notify("Buffer has unsaved changes", "error", { title = "Warning" })
	else
		if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
			vim.api.nvim_buf_delete(bufnr, { force = true })
		else
			vim.cmd("quit")
		end
	end
end, {})

vim.cmd([[cabbrev <expr> q getcmdtype() == ':' && getcmdline() == 'q' ? 'Q' : 'q']])

-- Mantener selección al tabular en modo visual
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })

-- Mapeos de plegado con ufo.nvim
map("n", "z", require("ufo").openAllFolds, { noremap = true, silent = true })
map("n", "Z", require("ufo").closeAllFolds, { noremap = true, silent = true })
map("n", "za", "za", { noremap = true, silent = true })

-- Mapeo para formatear el código con leader + c + f
map("n", "<leader>cf", function()
	vim.lsp.buf.format({ async = true }) -- Formateo del código
end, { noremap = true, silent = true })

-- Moverse a la siguiente pestaña con 'tt'
map("n", "tn", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- Moverse a la pestaña anterior con 'tn'
map("n", "tp", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

-- Toggle Neotree
local function toggle_neotree()
	local cwd = vim.loop.cwd() -- Obtener el directorio actual

	if vim.b.neo_tree_tabid and vim.b.neo_tree_tabid == 1 then
		-- Si Neotree está abierto, cerrarlo
		vim.cmd("Neotree close")
	else
		-- Abrir Neotree en el lateral izquierdo (position=left)
		vim.cmd("Neotree reveal filesystem position=left dir=" .. cwd)
	end
end

-- Mapeo de teclas para toggle Neotree
vim.keymap.set("n", "<F3>", toggle_neotree, { desc = "Toggle Explorer" })
vim.keymap.set("n", "-", toggle_neotree, { desc = "Open Explorer at Root" })
