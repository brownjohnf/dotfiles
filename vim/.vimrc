set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/NERDTree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

map <C-p> :NERDTreeToggle<CR>

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

