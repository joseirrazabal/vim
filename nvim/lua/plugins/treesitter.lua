local ensure_installed = {
  "bash",
  "blade",
  "css",
  "go",
  "gomod",
  "html",
  "javascript",
  "json",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "nix",
  "php",
  "phpdoc",
  "query",
  "rust",
  "sql",
  "svelte",
  "typescript",
  "regex",
  "vim",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    vim.filetype.add({
      pattern = {
        [".*%.blade%.php"] = "blade",
      },
    })

    local ts = require("nvim-treesitter")
    ts.setup()

    local installed = ts.get_installed("parsers")
    local missing = {}
    for _, lang in ipairs(ensure_installed) do
      if not vim.tbl_contains(installed, lang) then
        table.insert(missing, lang)
      end
    end
    if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
      ts.install(missing)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        if not pcall(vim.treesitter.start, args.buf) then
          return
        end
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
