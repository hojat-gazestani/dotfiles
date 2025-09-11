

" HTML-specific settings
augroup html_settings
  autocmd!

  " Enable HTML syntax highlighting and indentation
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal tabstop=2
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal expandtab
  autocmd FileType html setlocal autoindent
  autocmd FileType html setlocal smartindent

  " Enable HTML5 syntax (if your vim supports it)
  autocmd FileType html setlocal syntax=html

  " Enable matchit for HTML tag matching
  autocmd FileType html runtime macros/matchit.vim

  " Auto-close HTML tags
  autocmd FileType html inoremap <buffer> </ </<C-x><C-o>

  " Wrap text in HTML files
  autocmd FileType html setlocal wrap
  autocmd FileType html setlocal linebreak

  " Enable emmet-vim for HTML/CSS expansion
  autocmd FileType html imap <buffer> <C-y> <plug>(emmet-expand-abbr)
  autocmd FileType html nmap <buffer> <C-y> <plug>(emmet-expand-abbr)

  " Custom abbreviations for common HTML tags
  autocmd FileType html iabbrev <buffer> divl <div class=""><Left><Left>
  autocmd FileType html iabbrev <buffer> spanl <span class=""><Left><Left>
  autocmd FileType html iabbrev <buffer> imgl <img src="" alt=""><Left><Left><Left><Left><Left>
  autocmd FileType html iabbrev <buffer> al <a href=""></a><Left><Left><Left><Left>

  " Enable surround.vim for HTML tags if installed
  autocmd FileType html let b:surround_{char2nr('v')} = "<div>\r</div>"
  autocmd FileType html let b:surround_{char2nr('p')} = "<p>\r</p>"
augroup END

" General settings that help with HTML development
set mouse=a
set number              " Show line numbers
set relativenumber      " Show relative line numbers
set cursorline          " Highlight current line
set showmatch           " Highlight matching brackets
set wildmenu            " Visual autocomplete for command menu
set lazyredraw          " Redraw only when needed
set clipboard=unnamed   " Use system clipboard

" Enable folding for HTML (optional)
set foldmethod=indent
set foldlevelstart=20

" Key mappings for HTML development
nnoremap <leader>html :-1read $HOME/.vim/templates/html5.html<CR>3jwf>a
nnoremap <leader>tag :-1read $HOME/.vim/templates/html_tag.txt<CR>f>a

" Color scheme (optional but helpful)
colorscheme desert
set background=dark
syntax enable


" Python-specific settings
augroup python_settings
  autocmd!

  " Basic Python formatting
  autocmd FileType python setlocal shiftwidth=4
  autocmd FileType python setlocal tabstop=4
  autocmd FileType python setlocal softtabstop=4
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal autoindent
  autocmd FileType python setlocal smartindent
"  autocmd FileType python setlocal textwidth=79  " PEP-8 recommendation

  " Enable proper syntax highlighting
  autocmd FileType python setlocal syntax=python

  " Enable folding by indentation (optional)
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType python setlocal foldlevel=99

  " Auto-insert docstring on function definition
  autocmd FileType python nnoremap <buffer> <leader>d mzO"""<Esc>o"""<Esc>`z

  " Run current Python file
  autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:exec '!python' shellescape(@%, 1)<CR>
  autocmd FileType python nnoremap <buffer> <leader>t :w<CR>:exec '!python -m pytest' shellescape(@%, 1)<CR>

  " Python-specific abbreviations
  autocmd FileType python iabbrev <buffer> pdb import pdb; pdb.set_trace()
  autocmd FileType python iabbrev <buffer> iff if:<Left>
  autocmd FileType python iabbrev <buffer> main if __name__ == "__main__":<CR>

  " PEP-8 compliance helpers
  "autocmd FileType python highlight ExcessLength ctermbg=darkred guibg=#592929
  "autocmd FileType python match ExcessLength /\%>79v.\+/
augroup END

" General settings that help with Python development
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


" YAML-specific settings
augroup yaml_settings
  autocmd!

  " Basic YAML formatting
  autocmd FileType yaml setlocal shiftwidth=2
  autocmd FileType yaml setlocal tabstop=2
  autocmd FileType yaml setlocal softtabstop=2
  autocmd FileType yaml setlocal expandtab
  autocmd FileType yaml setlocal autoindent
  autocmd FileType yaml setlocal smartindent

  " Enable YAML syntax highlighting
  autocmd FileType yaml setlocal syntax=yaml

  " Enable folding by indentation (works well for YAML)
  autocmd FileType yaml setlocal foldmethod=indent
  autocmd FileType yaml setlocal foldlevel=99

  " YAML-specific mappings
  autocmd FileType yaml nnoremap <buffer> <leader>e :YAMLFold<CR>

  " YAML-specific abbreviations
  autocmd FileType yaml iabbrev <buffer> --- ---<CR># YAML Document<CR>
  autocmd FileType yaml iabbrev <buffer> [] []
  autocmd FileType yaml iabbrev <buffer> {} {}

  " Highlight trailing whitespace (important for YAML)
  autocmd FileType yaml highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd FileType yaml match ExtraWhitespace /\s\+$/

  " Wrap text in YAML files
  autocmd FileType yaml setlocal wrap
  autocmd FileType yaml setlocal linebreak

  " Comments in YAML
  autocmd FileType yaml setlocal commentstring=#\ %s

  " Disable automatic comment insertion on new line
  autocmd FileType yaml setlocal formatoptions-=cro
augroup END

" Also apply these settings to .yml files
augroup yml_settings
  autocmd!
  autocmd BufNewFile,BufRead *.yml set filetype=yaml
augroup END

" Persistent undo
set undofile
set undodir=~/.vim/undo


" C-specific settings
augroup c_settings
  autocmd!

  " Basic C formatting
  autocmd FileType c setlocal shiftwidth=4
  autocmd FileType c setlocal tabstop=4
  autocmd FileType c setlocal softtabstop=4
  autocmd FileType c setlocal expandtab
  autocmd FileType c setlocal autoindent
  autocmd FileType c setlocal smartindent
  autocmd FileType c setlocal cindent

  " Enable C syntax highlighting
  autocmd FileType c setlocal syntax=c

  " Enable folding by syntax (optional)
  autocmd FileType c setlocal foldmethod=syntax
  autocmd FileType c setlocal foldlevel=99

  " C-specific key mappings
  autocmd FileType c nnoremap <buffer> <leader>c I// <Esc>
  autocmd FileType c vnoremap <buffer> <leader>c :s/^/\/\/ /<CR>
  autocmd FileType c nnoremap <buffer> <leader>C ^3x
  autocmd FileType c vnoremap <buffer> <leader>C :s/^\/\/ //<CR>

  " Compile and run current C file
  autocmd FileType c nnoremap <buffer> <leader>r :w<CR>:!gcc -Wall -Wextra -std=c11 % -o %:r && ./%:r<CR>
  autocmd FileType c nnoremap <buffer> <leader>d :w<CR>:!gcc -g % -o %:r && gdb ./%:r<CR>
  autocmd FileType c nnoremap <buffer> <leader>m :w<CR>:!make<CR>

  " C-specific abbreviations
  autocmd FileType c iabbrev <buffer> inc #include <>
  autocmd FileType c iabbrev <buffer> Inc #include ""<Left>
  autocmd FileType c iabbrev <buffer> main int main(int argc, char *argv[]) {<CR>}<Up><End><CR>
  autocmd FileType c iabbrev <buffer> fori for (int i = 0; i < ; i++) {<CR>}<Up><End><Left><Left><Left><Left><Left>
  autocmd FileType c iabbrev <buffer> printf printf("");<Left><Left><Left>
  autocmd FileType c iabbrev <buffer> fprintf fprintf(stderr, "");<Left><Left><Left>
  autocmd FileType c iabbrev <buffer> if if () {<CR>}<Up><End><Left><Left>
  autocmd FileType c iabbrev <buffer> ife if () {<CR>} else {<CR>}<Up><Up><End><Left><Left>
  autocmd FileType c iabbrev <buffer> while while () {<CR>}<Up><End><Left><Left>
  autocmd FileType c iabbrev <buffer> switch switch () {<CR>case :<CR>break;<CR>default:<CR>break;<CR>}<Up><Up><Up><Up><End><Left><Left>

  " Highlight problematic whitespace
  autocmd FileType c highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd FileType c match ExtraWhitespace /\s\+$/

  " Set comment string
  autocmd FileType c setlocal commentstring=//\ %s
augroup END

" Also apply these settings to .h files
augroup header_settings
  autocmd!
  autocmd BufNewFile,BufRead *.h set filetype=c
augroup END

" General settings that help with C development
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

" Go-specific settings
augroup go_settings
  autocmd!

  " Basic Go formatting
  autocmd FileType go setlocal shiftwidth=4
  autocmd FileType go setlocal tabstop=4
  autocmd FileType go setlocal softtabstop=4
  autocmd FileType go setlocal noexpandtab " Go uses tabs by convention
  autocmd FileType go setlocal autoindent

  " Enable Go syntax highlighting
  autocmd FileType go setlocal syntax=go

  " Enable folding by syntax (optional)
  autocmd FileType go setlocal foldmethod=syntax
  autocmd FileType go setlocal foldlevel=99

  " Go-specific key mappings
  autocmd FileType go nnoremap <buffer> <leader>r :w<CR>:!go run %<CR>
  autocmd FileType go nnoremap <buffer> <leader>b :w<CR>:!go build<CR>
  autocmd FileType go nnoremap <buffer> <leader>t :w<CR>:!go test<CR>
  autocmd FileType go nnoremap <buffer> <leader>f :w<CR>:!gofmt -w %<CR>:e<CR>

  " Go-specific abbreviations
  autocmd FileType go iabbrev <buffer> iff if err != nil {<CR>}<Esc>O
  autocmd FileType go iabbrev <buffer> fun func () {<CR>}<Esc>O
  autocmd FileType go iabbrev <buffer> main func main() {<CR>}<Esc>O

  " Highlight trailing whitespace
  autocmd FileType go highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd FileType go match ExtraWhitespace /\s\+$/
augroup END

" Also apply these settings to .go files
augroup go_file_settings
  autocmd!
  autocmd BufNewFile,BufRead *.go set filetype=go
augroup END

" Bash-specific settings
augroup bash_settings
  autocmd!

  " Basic Bash formatting
  autocmd FileType sh setlocal shiftwidth=2
  autocmd FileType sh setlocal tabstop=2
  autocmd FileType sh setlocal softtabstop=2
  autocmd FileType sh setlocal expandtab
  autocmd FileType sh setlocal autoindent
  autocmd FileType sh setlocal smartindent

  " Enable Bash syntax highlighting
  autocmd FileType sh setlocal syntax=sh

  " Enable folding by syntax (optional)
  autocmd FileType sh setlocal foldmethod=marker
  autocmd FileType sh setlocal foldlevel=99

  " Bash-specific key mappings
  autocmd FileType sh nnoremap <buffer> <leader>r :w<CR>:!bash %<CR>
  autocmd FileType sh nnoremap <buffer> <leader>x :w<CR>:!chmod +x % && ./%<CR>
  autocmd FileType sh nnoremap <buffer> <leader>c I# <Esc>
  autocmd FileType sh vnoremap <buffer> <leader>c :s/^/# /<CR>
  autocmd FileType sh nnoremap <buffer> <leader>C ^x
  autocmd FileType sh vnoremap <buffer> <leader>C :s/^# //<CR>

  " Bash-specific abbreviations
  autocmd FileType sh iabbrev <buffer> #! #!/bin/bash
  autocmd FileType sh iabbrev <buffer> iff if [  ]; then<CR>fi<Esc>k$hi
  autocmd FileType sh iabbrev <buffer> fori for i in ; do<CR>done<Esc>k$hi
  autocmd FileType sh iabbrev <buffer> while while [  ]; do<CR>done<Esc>k$hi
  autocmd FileType sh iabbrev <buffer> case case  in<CR>) ;;<CR>esac<Esc>k0f i
  autocmd FileType sh iabbrev <buffer> func function  {<CR>}<Esc>k$hi

  " Highlight problematic whitespace
  autocmd FileType sh highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd FileType sh match ExtraWhitespace /\s\+$/

  " Set comment string
  autocmd FileType sh setlocal commentstring=#\ %s
augroup END

" Also apply these settings to .bash files
augroup bash_file_settings
  autocmd!
  autocmd BufNewFile,BufRead *.bash set filetype=sh
augroup END

" ShellCheck integration (if installed)
augroup shellcheck_settings
  autocmd!
  autocmd FileType sh setlocal makeprg=shellcheck\ -f\ gcc\ %
  autocmd FileType sh setlocal errorformat=%f:%l:%c:\ %m
  autocmd FileType sh nnoremap <buffer> <leader>l :make<CR>:cwindow<CR>
augroup END

" Rust-specific settings
augroup rust_settings
  autocmd!

  " Basic Rust formatting
  autocmd FileType rust setlocal shiftwidth=4
  autocmd FileType rust setlocal tabstop=4
  autocmd FileType rust setlocal softtabstop=4
  autocmd FileType rust setlocal expandtab
  autocmd FileType rust setlocal autoindent
  autocmd FileType rust setlocal smartindent

  " Enable Rust syntax highlighting
  autocmd FileType rust setlocal syntax=rust

  " Enable folding by syntax (optional)
  autocmd FileType rust setlocal foldmethod=syntax
  autocmd FileType rust setlocal foldlevel=99

  " Rust-specific key mappings
  autocmd FileType rust nnoremap <buffer> <leader>r :w<CR>:!cargo run<CR>
  autocmd FileType rust nnoremap <buffer> <leader>b :w<CR>:!cargo build<CR>
  autocmd FileType rust nnoremap <buffer> <leader>t :w<CR>:!cargo test<CR>
  autocmd FileType rust nnoremap <buffer> <leader>c :w<CR>:!cargo check<CR>
  autocmd FileType rust nnoremap <buffer> <leader>f :w<CR>:!rustfmt %<CR>:e<CR>
  autocmd FileType rust nnoremap <buffer> <leader>d :w<CR>:!rustdoc %<CR>

  " Rust-specific abbreviations
  autocmd FileType rust iabbrev <buffer> fn fn () {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> main fn main() {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> struct pub struct  {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> enum pub enum  {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> impl impl  {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> trait pub trait  {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> match match  {<CR>}<Esc>O
  autocmd FileType rust iabbrev <buffer> vec vec![]
  autocmd FileType rust iabbrev <buffer> println println!("");<Left><Left><Left>
  autocmd FileType rust iabbrev <buffer> eprintln eprintln!("");<Left><Left><Left>
  autocmd FileType rust iabbrev <buffer> format format!("");<Left><Left><Left>
  autocmd FileType rust iabbrev <buffer> letm let mut  = ;<Left><Left>
  autocmd FileType rust iabbrev <buffer> ifl if let  =  {<CR>}<Esc>O

  " Comment mappings
  autocmd FileType rust nnoremap <buffer> <leader>c I// <Esc>
  autocmd FileType rust vnoremap <buffer> <leader>c :s/^/\/\/ /<CR>
  autocmd FileType rust nnoremap <buffer> <leader>C ^3x
  autocmd FileType rust vnoremap <buffer> <leader>C :s/^\/\/ //<CR>

  " Highlight trailing whitespace
  autocmd FileType rust highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd FileType rust match ExtraWhitespace /\s\+$/

  " Set comment string
  autocmd FileType rust setlocal commentstring=//\ %s

  " Enable racer (Rust code completion) if installed
  autocmd FileType rust setlocal omnifunc=racer#Complete

  " Enable rust.vim enhanced features
  autocmd FileType rust let g:rustfmt_autosave = 1
  autocmd FileType rust let g:rust_clip_command = 'xclip -selection clipboard'
augroup END

" Also apply these settings to .rs files
augroup rust_file_settings
  autocmd!
  autocmd BufNewFile,BufRead *.rs set filetype=rust
augroup END

" Cargo.toml file settings
augroup toml_settings
  autocmd!
  autocmd BufNewFile,BufRead Cargo.toml set filetype=toml
  autocmd FileType toml setlocal shiftwidth=2
  autocmd FileType toml setlocal tabstop=2
  autocmd FileType toml setlocal softtabstop=2
  autocmd FileType toml setlocal expandtab
augroup END
