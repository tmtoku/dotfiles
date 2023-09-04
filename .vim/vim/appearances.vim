" Appearances -------------------------

" Display line numbers
set number	
set numberwidth=4

" Always draw the signcolumn
set signcolumn=yes

" Don't wrap lines
set nowrap

" Enable filetype specific plugins and auto-indenting
if has('filetype')
  filetype plugin indent on
endif

" Colorscheme
set t_Co=256
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme solarized8_high
set cursorline

" Enable Syntax highlighting
if has('syntax')
  syntax on
endif

" Highlight matching parentheses
set showmatch

" Convert <Tab> to spaces
set expandtab
set tabstop=4
set softtabstop=4

" Keep the same indent when starting a new line
set autoindent
" Auto-indentations react to the syntax of the code 
set smartindent
set shiftwidth=4

" Always show status line
set laststatus=2
set noshowmode
set showcmd
