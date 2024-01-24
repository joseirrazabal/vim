return  {
  -- -- con leader xx mustra todos los conflictos
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  --
  -- },
  {
    "folke/trouble.nvim",
    enabled = true,
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = { { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble toggle" } },
    config = true,
  },
  -- ver en una barra a la derecha las funciones, ver como permite cambiar nombre
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
}

