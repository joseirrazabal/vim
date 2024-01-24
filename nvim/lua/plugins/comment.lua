return {
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", desc = "Comment current line" },
    { "gc", mode = "v", desc = "Comment selected text" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  opts = function()
    local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
  end,
  config = true,
}
