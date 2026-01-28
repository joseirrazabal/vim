return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim", -- Para gestionar los servidores LSP
		"folke/neodev.nvim", -- Para mejorar la integración con Neovim Lua
	},
	config = function()
		local on_attach = function(client, bufnr)
			-- Desactivar el mapeo predeterminado de 'K' para 'hover'
		end

		-- Setup para neodev (mejora el soporte para Lua)
		require("neodev").setup({})

		-- Configuración para Lua (lua_ls)
		vim.lsp.config("lua_ls", {
			-- on_attach = on_attach
		})
		vim.lsp.enable("lua_ls")

		-- Configuración para TypeScript (ts_ls)
		vim.lsp.config("ts_ls", {
			on_attach = on_attach,
		})
		vim.lsp.enable("ts_ls")

		-- Configuración para Rust (rust-analyzer)
		vim.lsp.config("rust_analyzer", {
			on_attach = on_attach,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					checkOnSave = {
						command = "clippy", -- Usa Clippy para linting en cada guardado
					},
				},
			},
		})
		vim.lsp.enable("rust_analyzer")
	end,
}
