return {
  {"sindrets/diffview.nvim"},
  {"rmagatti/goto-preview"},
  {"tpope/vim-fugitive"},
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
    config = function()
      local conform = require("conform")

      conform.setup({
          formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            svelte = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            lua = { "stylua" },
            python = { "isort", "black" },
          },
          format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          },
        })

      -- vim.keymap.set({ "n", "v" }, "<leader>i", function()
      --   conform.format({
      --       lsp_fallback = true,
      --       async = false,
      --       timeout_ms = 1000,
      --     })
      -- end, { desc = "Format file or range (in visual mode)" })
  end,
},
{
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

    -- vim.keymap.set("n", "<leader>l", function()
    --   lint.try_lint()
    -- end, { desc = "Trigger linting for current file" })
end,
}
}
