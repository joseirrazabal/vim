return {
    'rcarriga/nvim-notify',
    config = function()
        vim.notify = require("notify")

        -- Configuración de opciones
        require("notify").setup {
            background_colour = "#000000",
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
            on_open = function(win)
                vim.api.nvim_win_set_config(win, { zindex = 100 })
            end
        }

        -- Mapeo de teclas para descartar notificaciones
        vim.keymap.set("n", "<leader>un", function()
            require("notify").dismiss({ silent = true, pending = true })
        end, { desc = "Dismiss all Notifications" })
    end
}