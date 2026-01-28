return {
  "renerocksai/telekasten.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  config = function()
    require("telekasten").setup({
      home = vim.fn.expand("~/notes"),
      dailies = vim.fn.expand("~/notes/dailies"),
      weeklies = vim.fn.expand("~/notes/weeklies"),
    })
  end,
}
