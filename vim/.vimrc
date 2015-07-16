set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()
map <C-n> :NERDTreeToggle<CR>

set t_Co=256
set background=dark
set autoindent
set number
set hlsearch
set incsearch
set ignorecase
set hidden
set history=100
set wildmode=list:longest
set smartcase
set title
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set tabstop=2
set shiftwidth=2
set equalalways " always set window splits to equal heights
set listchars=tab:>✖,trail:✖

" Disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax enable
filetype on
filetype plugin on
filetype indent on

"" Used for showing non-printing characters
" set list

"set expandtab

" clean up trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" set the tags search path to look in the .git folder (as configured via git
" hooks
set tags=.git/tags,./tags,tags
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

