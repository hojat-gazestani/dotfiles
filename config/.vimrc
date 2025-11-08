filetype plugin on

" General settings that help with HTML development
set mouse=a
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set cursorline          " Highlight current line
set showmatch           " Highlight matching brackets
set wildmenu            " Visual autocomplete for command menu
set lazyredraw          " Redraw only when needed
set clipboard=unnamed   " Use system clipboard

" Better search options
set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches
nnoremap <leader><space> :nohlsearch<CR>  " Turn off search highlight

" Color scheme (important for syntax highlighting)
colorscheme desert
set background=dark
syntax enable

" Persistent undo
set undofile
set undodir=~/.vim/undo

" Filetype detection
autocmd BufNewFile,BufRead *.h set filetype=c
autocmd BufNewFile,BufRead *.bash set filetype=sh
autocmd BufNewFile,BufRead *.go set filetype=go
autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.yml set filetype=yaml

call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'tpope/vim-sensible'                     " Sensible defaults
Plug 'scrooloose/nerdtree'                    " File explorer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                       " Fuzzy finder
Plug 'tpope/vim-commentary'                   " Comment tool
Plug 'tpope/vim-surround'                     " Surround text
Plug 'tpope/vim-fugitive'                     " Git commands
Plug 'airblade/vim-gitgutter'                 " Git diff
Plug 'vim-airline/vim-airline'                " Status line
Plug 'vim-airline/vim-airline-themes'         " Themes
Plug 'nanotech/jellybeans.vim'                " Color scheme
Plug 'sheerun/vim-polyglot'                   " Language pack
"
" Python & Django specific plugins (Ruff-compatible)
Plug 'davidhalter/jedi-vim'                    " Python autocompletion
Plug 'tweekmonster/django-plus.vim'            " Django support
Plug 'vim-scripts/django.vim'                  " Django template syntax
Plug 'mgedmin/po.vim'                          " Django translation files
Plug 'alfredodeza/pytest.vim'                  " Pytest integration
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' } " Docstring generation

Plug 'neoclide/coc.nvim', {'branch': 'release'} " For Ruff LSP support

call plug#end()


" CoC key mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>rn <Plug>(coc-rename)

" Ruff format on save
autocmd BufWritePre *.py :call CocAction('format')

let g:lsp_settings_filetype_python = ['ruff']
