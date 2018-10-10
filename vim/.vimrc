call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'posva/vim-vue'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-syntastic/syntastic'
Plug 'w0ng/vim-hybrid'
Plug 'zah/nim.vim'
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

set autoindent
set background=dark
set colorcolumn=+1
set cursorcolumn
set cursorline
set equalalways " always set window splits to equal heights
set expandtab " use spaces in place of tabs
set formatoptions+=w
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set listchars=tab:>.,trail:✖ " limit non-printing chars to tab/trail
set list " Used for showing non-printing characters
set number
set shiftwidth=2
set smartcase
set tabstop=2
set t_Co=256
set title
set tw=80
set wildignore+=dist
set wildignore+=node_modules
set wildmode=list:longest

let NERDTreeRespectWildIgnore=1

color codedark

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

au BufReadPost Dockerfile* set syntax=dockerfile

let b:thisdir=expand("%:p:h")
let b:vimlocal=b:thisdir."/vimlocal"
if (filereadable(b:vimlocal))
  execute "source ".b:vimlocal
endif

" Set some custom color overrides
" make special characters almost black
hi SpecialKey ctermfg=darkgray

" highlight matches for searches in yellow
hi Search ctermfg=Black ctermbg=Yellow cterm=bold,underline

hi CursorColumn ctermbg=235 cterm=bold
