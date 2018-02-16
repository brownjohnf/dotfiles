call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-syntastic/syntastic'
Plug 'zah/nim.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
call plug#end()

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <Leader>a :Ack!<Space>

let g:jsx_ext_required = 0

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

set nocompatible              " be iMproved, required

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
set tabstop=2
set shiftwidth=2
set equalalways " always set window splits to equal heights
set list " Used for showing non-printing characters
set listchars=tab:>.,trail:✖ " limit non-printing chars to tab/trail
set expandtab " use spaces in place of tabs
set formatoptions+=w
set tw=80
set cursorline
set cursorcolumn
set colorcolumn=+1
set wildignore+=node_modules

let NERDTreeRespectWildIgnore=1

color dracula

" make special characters almost black
hi SpecialKey ctermfg=darkgray

" Disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
:nnoremap <Leader>c :set cursorcolumn!<CR>

" Set up custom mappings
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-p> :Files<CR>
nmap <Leader>r :tags<CR>


" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

syntax on
filetype plugin indent on

" clean up trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" set the tags search path to look in the .git folder (as configured via git
" hooks
set tags=.git/tags,./tags,tags
nnoremap <silent> [[ :bprevious<CR>
nnoremap <silent> ]] :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

autocmd FileType go set nolist
autocmd FileType go set noexpandtab

autocmd FileType systemd set nolist
autocmd FileType systemd set noexpandtab

let b:thisdir=expand("%:p:h")
let b:vimlocal=b:thisdir."/vimlocal"
if (filereadable(b:vimlocal))
  execute "source ".b:vimlocal
endif

