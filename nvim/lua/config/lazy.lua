local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  default = {
    lazy = true,
  },
  checker = {
    enabled = true,
    notify = false
  },
  ui = {
    border = "rounded",
  },
  -- dev = {
  --   path = "~/code/plugins",
  --   fallback = true,
  --   patterns = { "jose" },
  -- },
  -- performance = {
  --   rtp = {
  --     disabled_plugins = {
  --       "gzip",
  --       "matchit",
  --       "matchparen",
  --       "netrwPlugin",
  --       "tarPlugin",
  --       "tohtml",
  --       "tutor",
  --       "zipPlugin",
  --     },
  --   },
  -- },
}

local map = vim.keymap.set

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
      map({'n', 'v'}, '<S-K>', '5k<CR>', { noremap = true, silent = true })
    end
  })
