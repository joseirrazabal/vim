return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({})

		local wk = require("which-key")

		-- Keymaps para el modo Normal
		wk.add({
			{ "%", "<Plug>(MatchitNormalForward)", desc = "Matchit Forward" },
			{ "[%", "<Plug>(MatchitNormalMultiBackward)", desc = "Matchit Multi Backward" },
			{ "]%", "<Plug>(MatchitNormalMultiForward)", desc = "Matchit Multi Forward" },
			{ "N", "Nzzzv", desc = "Search Previous Highlight and Center" },
			{ "Y", "y$", desc = "Yank to End of Line" },
			{ "H", "<Lua 22>", desc = "Move Left" },
			{ "L", "$", desc = "End of Line" },
			{ "[b", "<Cmd>BufferLineCyclePrev<CR>", desc = "Cycle to Previous Buffer" },
			{ "]b", "<Cmd>BufferLineCycleNext<CR>", desc = "Cycle to Next Buffer" },
			{ "\\", ":Neotree reveal<CR>", desc = "Reveal File in NeoTree" },
			{ "z", "za", desc = "Toggle Fold" },
			{ "Z", "<Lua 851>", desc = "Toggle Fold" },
			{ "gb", "<Lua 193>", desc = "Comment Toggle Blockwise" },
			{ "gcc", "<Lua 192>", desc = "Comment Current Line" },
			{ "<C-f>", ":Telescope live_grep<CR>", desc = "Grep in Project" },
			{ "<C-p>", ":Telescope find_files<CR>", desc = "Find files" },

			-- Grupo para tabs y buffers
			{ "<leader>t", group = "tabs" },
			{ "<leader>tn", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
			{ "<leader>tp", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
			{ "<leader>tt", ":tabnew<CR>", desc = "Open New Tab" },
			{ "<leader>td", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close Ungrouped Buffers" },
			{ "<leader>tl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close Buffers Left" },
			{ "<leader>tr", "<Cmd>BufferLineCloseRight<CR>", desc = "Close Buffers Right" },
			{ "<leader>to", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
			{ "<leader>tT", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Buffer Pin" },
			{ "<leader>tq", "<cmd>bd!<CR>", desc = "Close Buffer without Saving" },

			-- Grupo para telescope
			{ "<leader>f", group = "telescope" },
			{ "<leader>fc", ":Telescope git_bcommits<CR>", desc = "Telescope Git Commits" },
			{ "<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find Files" },
			{ "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep in Project" },
			{ "<leader>fb", ":Telescope buffers<CR>", desc = "Grep in Project" },

			-- Grupo para navegación o herramientas de desarrollo
			{ "<leader>g", group = "goto-preview" }, -- Agrupa las herramientas de goto-preview

			-- Grupo para "m" (maintenance)
			{ "<leader>m", group = "management" }, -- Grupo para acciones de management o configuración
			{
				"<leader>mr",
				function()
					require("lazy").sync()
					package.loaded["config.keymaps"] = nil
					require("config.keymaps")
					vim.notify("Plugins y configuración recargados!", "info", { title = "Neovim" })
				end,
				desc = "Recargar configuración",
			},
			{
				"<leader>mn",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},

			-- Grupo para LSP (trabajar con el código)
			{ "<leader>c", group = "code" },
			{
				"<leader>cf",
				function()
					vim.lsp.buf.format({ async = true })
				end,
				desc = "Formatear código",
			},
			{ "<leader>ci", "<Cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover Documentation" }, -- Documentación flotante con hover
			{ "<leader>cd", "<Cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" }, -- Ir a la definición
			{ "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
			{ "<leader>cx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>ct", "<cmd>Trouble todo toggle<cr>", desc = "Diagnostics (Trouble)" },
			{
				"<leader>cp",
				"<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
				desc = "Goto Definition Preview",
			},
			{
				"<leader>cc",
				"<cmd>lua require('goto-preview').close_all_win ()<CR>",
				desc = "Close Definition Preview",
			},

			-- Grupo "g" para acciones de Git
			{ "<leader>g", group = "git" },
			-- Estado y commit
			{ "<leader>gs", "<cmd>Git<CR>", desc = "Git Status" },
			{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit" },
			-- Push y fetch
			{ "<leader>gp", "<cmd>Git push<CR>", desc = "Git Push" },
			{ "<leader>gf", "<cmd>Git fetch<CR>", desc = "Git Fetch" },
			-- Acciones adicionales
			{ "<leader>gb", "<cmd>Git branch<CR>", desc = "Git Branch" },
			-- Acciones con diffs y ramas
			{ "<leader>gd", "<cmd>Gvdiffsplit<CR>", desc = "Git Diff" }, -- Ver el diff en split vertical
			{ "<leader>gb", "<cmd>Git branch<CR>", desc = "Git Branches" }, -- Mostrar las ramas
			{ "<leader>gB", "<cmd>Git blame<CR>", desc = "Git Blame" }, -- Ver blame en el archivo actual
			-- Blame en la línea actual
			{ "<leader>gl", ":Gitsigns blame_line<CR>", desc = "Blame Line" },

			{ "<leader>k", group = "kulala rest" },
			{ "<leader>kr", "<cmd>lua require('kulala').run()<CR>", desc = "Kulala run" },
			{ "<leader>kp", "<cmd>lua require('kulala').jump_prev()<CR>", desc = "Kulala jump prev" },
			{ "<leader>kn", "<cmd>lua require('kulala').jump_next()<CR>", desc = "Kulala jump next" },
			{ "<leader>ke", "<cmd>lua require('kulala').set_selected_env()<CR>", desc = "Kulala select env" },
			{ "<leader>kc", "<cmd>lua require('kulala').copy()<CR>", desc = "Kulala copy" },
			{ "<leader>kf", "<cmd>lua require('kulala').from_curl()<CR>", desc = "Kulala parse curl" },

			{ "<leader>p", group = "ChatGpt" },
			{ "<leader>po", "<cmd>ChatGPT<CR>", desc = "Abrir ChatGPT" },
			{ "<leader>pe", "<cmd>ChatGPTEditWithInstructions<CR>", desc = "Editar con instrucciones" },
			{ "<leader>pr", "<cmd>ChatGPTCompleteCode<CR>", desc = "Completar código" },
			{ "<leader>pl", "<cmd>ChatGPTRunLast<CR>", desc = "Ejecutar último comando" },
		}, { mode = "n" })

		-- Keymaps para el modo Visual
		wk.add({
			{ "%", "<Plug>(MatchitVisualForward)", desc = "Matchit Forward" },
			{ "<", "<gv", desc = "Indent Left" },
			{ ">", ">gv", desc = "Indent Right" },
			{ "S", "<Plug>(nvim-surround-visual)", desc = "Surround Visual" },
			{ "[%", "<Plug>(MatchitVisualMultiBackward)", desc = "Matchit Multi Backward" },
			{ "]%", "<Plug>(MatchitVisualMultiForward)", desc = "Matchit Multi Forward" },
			{ "a%", "<Plug>(MatchitVisualTextObject)", desc = "Matchit Text Object" },
			{ "ai", "<Cmd>lua MiniIndentscope.textobject(true)<CR>", desc = "Object Scope with Border" },
			{ "ii", "<Cmd>lua MiniIndentscope.textobject(false)<CR>", desc = "Object Scope" },
			{ "gS", "<Plug>(nvim-surround-visual-line)", desc = "Surround Visual Line Mode" },
			{ "gc", "<Lua 191>", desc = "Comment Visual" },
			{ "gb", "<Lua 190>", desc = "Comment Block Visual" },
		}, { mode = "v" })

		-- Keymaps para el modo Insert
		wk.add({
			{ "<C-Space>", "<Cmd>lua require('cmp').complete()<CR>", desc = "Autocomplete" },
			-- { "<C-P>", "<Cmd>lua require('cmp').complete()<CR>", desc = "Previous Completion Item" },
			{ "<C-N>", "<Cmd>lua require('cmp').complete()<CR>", desc = "Next Completion Item" },
			{ "<Tab>", "<Cmd>lua require('cmp').select_next_item()<CR>", desc = "Next Completion" },
			-- { "<CR>", "<Lua 942>", desc = "Confirm Completion" },
			-- { "<C-K>", "<Lua 1182>", desc = "Move Up in Completion" },
			-- { "<C-J>", "<Lua 1183>", desc = "Move Down in Completion" },
			{ "<C-W>", "<C-G>u<C-W>", desc = "Delete Word Backwards" },
			-- { "<C-U>", "<Lua 1219>", desc = "Scroll Completion Up" },
			{ "<M-Bslash>", "<Plug>(copilot-suggest)", desc = "Copilot Suggest" },
			{ "<M-Right>", "<Plug>(copilot-accept-word)", desc = "Copilot Accept Word" },
			{ "<M-C-Right>", "<Plug>(copilot-accept-line)", desc = "Copilot Accept Line" },
			{ "<Plug>(copilot-previous)", "<Cmd>call copilot#Previous()<CR>", desc = "Copilot Previous Suggestion" },
			{ "<Plug>(copilot-next)", "<Cmd>call copilot#Next()<CR>", desc = "Copilot Next Suggestion" },
			{ "<C-G>S", "<Plug>(nvim-surround-insert-line)", desc = "Add Surrounding Pair on New Lines" },
			{ "<C-G>s", "<Plug>(nvim-surround-insert)", desc = "Add Surrounding Pair Around Cursor" },
		}, { mode = "i" })
	end,
}
