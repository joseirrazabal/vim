return {
  "akinsho/bufferline.nvim",
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = "VeryLazy",
  keys = {
    -- { "<leader>tt", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    -- { "<leader>p", "<Cmd>BufferLineMovePrev<CR>", desc = "Toggle pin" },
    -- { "<leader>n", "<Cmd>BufferLineMoveNext<CR>", desc = "Toggle pin" },
    -- { "<leader>bd", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    -- { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    -- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
    -- { "tp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    -- { "tn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    -- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    -- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },

  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
  -- config = function(_, opts)
  --   require("bufferline").setup(opts)
  --   -- Fix bufferline when restoring a session
  --   vim.api.nvim_create_autocmd("BufAdd", {
  --       callback = function()
  --         vim.schedule(function()
  --           pcall(nvim_bufferline)
  --         end)
  --       end,
  --     })
  -- end,
}
