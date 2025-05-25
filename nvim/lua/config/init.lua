require("config.options")
-- autocmds and keymaps can wait to load
vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
		require("config.bufferline")
		require("config.telescope")
		require("config.autopairs")
		require("config.illuminate")
		require("config.ufo")
		require("config.goto-preview")
		require("config.chatgpt")
	end,
})
require("config.lazy")
