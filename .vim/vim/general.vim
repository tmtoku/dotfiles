" Basic Settings -------------------------

set nocompatible

" Set encoding to UTF-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

" Enable the mouse for normal mode and visual mode
if has('mouse')
  set mouse=nv
  set ttymouse=sgr
endif

" Disable all bells
set belloff=all

" Allow hidden buffers
set hidden

" Fast terminal connection
set ttyfast

" Redraw screen only when we need to
set lazyredraw

" Time out on mapping after 'timeoutlen' milliseconds
" Time out on key codes after 'ttimeoutlen' milliseconds
set timeout timeoutlen=1000 ttimeoutlen=10


" Autocommands -------------------------

autocmd BufWritePre <buffer> LspDocumentFormatSync
