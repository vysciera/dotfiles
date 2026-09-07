vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.plugins")

vim.cmd.colorscheme("flexoki-dark")

require("config.treesitter")
require("config.completion")
require("config.lsp")
require("config.statusline")
