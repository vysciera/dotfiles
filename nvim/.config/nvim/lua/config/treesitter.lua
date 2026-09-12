local ts = require("nvim-treesitter")

ts.setup({})

local parsers = {
  "bash",
  "c",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "ruby",
  "rust",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
}

ts.install(parsers)

local filetypes = {
  "bash",
  "c",
  "go",
  "gomod",
  "gowork",
  "json",
  "lua",
  "markdown",
  "python",
  "ruby",
  "rust",
  "toml",
  "vim",
  "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,

  callback = function()
    vim.treesitter.start()
  end,
})
