-- Basic Settings
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.background = "dark"


-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Persistent undo
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir

-- Folding (treesitter)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Optional: Set initial state to fully expanded
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- Optional: Show fold column on the left (width 1)
vim.opt.foldcolumn = "1"

-- Airline
-- vim.g.airline_powerline_fonts = 1
