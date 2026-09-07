local opt = vim.opt

vim.opt.background = "dark"

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.showmode = false

-- Editing
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Timing
opt.updatetime = 250
opt.timeoutlen = 400
