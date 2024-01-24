return {
  { "EdenEast/nightfox.nvim" ,
    config = function()
      vim.cmd.colorscheme "nightfox"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = true,
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerDetachFromBuffer", "ColorizerReloadAllBuffers" },
  --   opts = { user_default_options = { names = false } },
  -- },
  -- { "ellisonleao/gruvbox.nvim" },
  -- {
  --   "wuelnerdotexe/vim-enfocado",
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     vim.g.enfocado_style = "neon"
  --   end,
  --   config = function()
  --     vim.cmd.colorscheme "enfocado"
  --   end,
  -- },

  --   {
  --     "LazyVim/LazyVim",
  --     opts = {
  --       colorscheme = "gruvbox",
  --     },
  --   },
}
--
