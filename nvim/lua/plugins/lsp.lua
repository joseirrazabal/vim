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
		require("lspconfig").lua_ls.setup({
			-- on_attach = on_attach
		})

		-- Configuración para TypeScript (ts_ls)
		require("lspconfig").ts_ls.setup({
			on_attach = on_attach
		})

		-- Configuración para Rust (rust-analyzer)
		require("lspconfig").rust_analyzer.setup({
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
	end,
}
