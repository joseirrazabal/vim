local map = vim.keymap.set

-- -- Mapeo para mover hacia abajo 5 líneas con Shift+J
map({'n', 'v'}, '<S-J>', '5j<CR>', { noremap = true, silent = true })
-- -- Mapeo para mover hacia arriba 5 líneas con Shift+K
map({'n', 'v'}, '<S-K>', '5k<CR>', { noremap = true, silent = true })

-- new tab
map('n', 'tt', ':tabnew<CR>', { noremap = true, silent = true })

-- -- Mapeo para ir al inicio de la línea con Shift+H
map({'n', 'v'}, '<S-H>', '^', { noremap = true })
-- -- Mapeo para ir al final de la línea con Shift+L
map({'n','v'}, '<S-L>', '$', { noremap = true })


-- al buscar trata de estar siempre en el medio
map('n', 'n', 'nzzzv', { noremap = true })
map('n', 'N', 'Nzzzv', { noremap = true })
map('n', '<leader>p', '"_diwP', { noremap = true })
map('n', '<leader>w', '"_diw', { noremap = true })

-- Mapeo para abrir el archivo referenciado en una importación con ff
vim.api.nvim_set_keymap('n', 'ff', ':normal! $bbgf<CR>', { noremap = true, silent = true })

local function toggle_neotree()
	-- Verificar si la variable b:neo_tree_tabid existe y es igual a 1
	if vim.b.neo_tree_tabid and vim.b.neo_tree_tabid == 1 then
		vim.cmd('Neotree close')
	else
		vim.cmd('Neotree reveal')
	end
end

map('n', '<F3>', toggle_neotree, { desc = 'Toggle Explorer' })

-- ===========================

local function open_neotree_at_root()
	if vim.b.neo_tree_tabid and vim.b.neo_tree_tabid == 1 then
		vim.cmd('Neotree close')
	else
		-- Obtener el directorio de trabajo actual desde donde Neovim fue lanzado
		local cwd = vim.loop.cwd()
		-- Cambiar el directorio de trabajo de Neovim a ese directorio
		vim.cmd('cd ' .. cwd)
		-- Abrir Neotree en ese directorio
		vim.cmd('Neotree reveal')
		-- vim.cmd('Neotree action=close_all_nodes')
	end
end

map('n', '-', open_neotree_at_root, { desc = 'Open Explorer at Root' })


vim.api.nvim_create_user_command('Q', function()
	local bufnr = vim.api.nvim_get_current_buf()
	-- Verificar si el buffer tiene cambios no guardados
	if vim.api.nvim_buf_get_option(bufnr, 'modified') then
		-- Mostrar una notificación en lugar de cerrar el buffer
		vim.notify("Buffer has unsaved changes", "error", { title = "Warning" })
	else
		-- Si no hay cambios no guardados, proceder a cerrar el buffer
		if #vim.fn.getbufinfo({buflisted = 1}) > 1 then
			vim.api.nvim_buf_delete(bufnr, {force = true})
		else
			vim.cmd('quit')
		end
	end
end, {})

-- Reemplazar ':q' con ':Q' en el modo de comandos
vim.cmd [[cabbrev <expr> q getcmdtype() == ':' && getcmdline() == 'q' ? 'Q' : 'q']]


-- vim.notify = require("notify")
-- vim.notify("Acción ejecutada, probando el largo del mensaje, aca unas palabras para ver bien que es lo que hace cuando un texto es demasiado largo", "info")
