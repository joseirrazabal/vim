return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "folke/neodev.nvim"
    },
    config = function()
        local on_attach = function(client, bufnr)
            -- Desactivar el mapeo predeterminado de 'K' para 'hover'
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Nop>', {noremap = true, silent = true})
            -- Aquí puedes añadir otros mapeos o configuraciones para el LSP
        end

        require("neodev").setup({})
        require("lspconfig").lua_ls.setup({
            -- on_attach = on_attach
        })
        require("lspconfig").tsserver.setup({
            -- on_attach = on_attach
        })
    end
}
