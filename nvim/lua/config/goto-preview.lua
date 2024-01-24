require("goto-preview").setup()

vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true, desc="ir a la definicion"})
vim.keymap.set("n", "gpc", "<cmd>lua require('goto-preview').close_all_win ()<CR>", {noremap=true, desc="cerrar ventanas de definicion"})
