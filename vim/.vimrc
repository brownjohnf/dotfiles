set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()

map <C-n> :NERDTreeToggle<CR>

set t_Co=256
set background=dark
" colorscheme solarized
" color molokai
" let g:molokai_original = 1

set autoindent
set number
set hlsearch
set ignorecase

set mouse=a

set hidden
set history=100
set wildmode=list:longest
set ignorecase
set smartcase
set title
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
syntax enable
filetype on
filetype plugin on
filetype indent on
set hlsearch
set incsearch
" set list
" set listchars=tab:>-,trail:>.,eol:$

"set expandtab
set tabstop=2
set shiftwidth=2
set guifont=ComicSansNeueMono:20 "Monospace:20

" set columns=175 "full width
" set lines=53 "full height
" set equalalways
" vnew

autocmd BufWritePre * :%s/\s\+$//e

