-- Basic Settings
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.lazyredraw = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.background = "dark"

vim.g.mapleader = " "

-- clear search highlight
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Persistent undo
vim.opt.undofile = true
local undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(undodir, "p")
vim.opt.undodir = undodir

-- Filetypes
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  command = "set filetype=c"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.bash",
  command = "set filetype=sh"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.go",
  command = "set filetype=go"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.rs",
  command = "set filetype=rust"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.yml",
  command = "set filetype=yaml"
})

-- Plugins (vim-plug still works in Lua)
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')

vim.fn['plug#']('preservim/nerdtree')
vim.fn['plug#']('Xuyuanp/nerdtree-git-plugin')

vim.fn['plug#']('junegunn/fzf')
vim.fn['plug#']('junegunn/fzf.vim')

vim.fn['plug#']('tpope/vim-sensible')
vim.fn['plug#']('tpope/vim-commentary')
vim.fn['plug#']('tpope/vim-surround')

vim.fn['plug#']('tpope/vim-fugitive')
vim.fn['plug#']('airblade/vim-gitgutter')

vim.fn['plug#']('vim-airline/vim-airline')
vim.fn['plug#']('vim-airline/vim-airline-themes')
vim.fn['plug#']('nanotech/jellybeans.vim')

vim.fn['plug#']('sheerun/vim-polyglot')

vim.fn['plug#']('alfredodeza/pytest.vim')
vim.fn['plug#']('tweekmonster/django-plus.vim')
vim.fn['plug#']('vim-scripts/django.vim')

vim.call('plug#end')

-- Theme
vim.cmd("colorscheme jellybeans")

-- Keymaps
vim.keymap.set("n", "<leader>n", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<leader>f", ":Files<CR>")
vim.keymap.set("n", "<leader>b", ":Buffers<CR>")
vim.keymap.set("n", "<leader>rg", ":Rg<CR>")
vim.keymap.set("n", "<leader>gs", ":Git<CR>")

-- Ruff auto format
if vim.fn.executable("ruff") == 1 then
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = function()
      vim.cmd("silent !ruff format %")
    end
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    command = "edit!"
  })
end

-- Airline
vim.g.airline_powerline_fonts = 1

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
