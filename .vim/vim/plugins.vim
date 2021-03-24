if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'dracula/vim'
Plug 'connorholyday/vim-snazzy'
Plug 'lifepillar/vim-solarized8'
Plug 'tomasr/molokai'

" Status Line
Plug 'itchyny/lightline.vim'

" Comment Out
Plug 'tpope/vim-commentary'

" Delete/Change/Add surroundings
Plug 'tpope/vim-surround'

" Language servers for vim
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Auto-completion
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Insert/Delete brakets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
