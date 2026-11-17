return {
  "jackMort/ChatGPT.nvim",
  cmd = {
    "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions",
    "ChatGPTRun", "ChatGPTCompleteCode", "ChatGPTAwesomePrompts",
  },
  config = function()
    require("config.chatgpt")
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  }
}
