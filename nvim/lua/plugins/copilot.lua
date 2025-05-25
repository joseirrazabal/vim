-- return {
--   {
--     'github/copilot.vim'
--   },
--   -- { "zbirenbaum/copilot-cmp",
--   --   config = function ()
--   --     require("copilot_cmp").setup()
--   --   end
--   -- }
-- }

-- return {
--   "zbirenbaum/copilot.lua",
--   cmd = "Copilot",
--   event = "InsertEnter",
--   config = function()
--     require("copilot").setup({})
--   end,
-- }
--
return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = false },
    })
  end,
}
