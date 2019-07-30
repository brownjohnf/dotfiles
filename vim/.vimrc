" Enable completion where available.
" " This setting must be set before ALE is loaded.
" let g:ale_completion_enabled = 1
call plug#begin('~/.vim/plugged')

" Try my task runner
"Plug '/Users/jack/neovim-task-runner'

" Show's updated lines in the gutter
Plug 'airblade/vim-gitgutter'
"Plug 'Chiel92/vim-autoformat'
Plug 'fatih/vim-go', { 'for': 'go' }
" Provides the /Tab alignment shortcut
Plug 'godlygeek/tabular'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
" This will install fzf for us
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " This is the fzf plugin
Plug 'majutsushi/tagbar'
"Plug 'mileszs/ack.vim'
"Plug 'nvie/vim-flake8'
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
" Provides autocomplete
Plug 'Valloric/YouCompleteMe'
"Plug 'vim-syntastic/syntastic'
" Provide commands to generate dot-based diagrams
Plug 'wannesm/wmgraphviz.vim'
" Provides real-time syntax/compilation linting
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'integralist/vim-mypy', { 'for': 'python' }
call plug#end()

"let g:ale_fixers = {
"\   'go': ['gofmt'],
"\   'rust': ['rustfmt'],
"\}

" rls doesn't work; not sure why
"let g:ale_linters = {
"\ 'rust': ['rls'],
"\}

" Always show the ale gutter, so the buffer doesn't jump back and forth
let g:ale_sign_column_always = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Set the leader key to spacebar
let mapleader=' '
" Unmap other functions from spacebar
nnoremap <space> <nop>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nmap <Leader>a :Ack!<Space>

let vim_markdown_preview_hotkey='<C-m>'

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
set tw=72
set wildignore+=dist
set wildignore+=node_modules
set wildignore+=target
set wildmode=list:longest
set foldlevel=99
set showcmd

let NERDTreeRespectWildIgnore=1
let python_highlight_all=1

color codedark

" Disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
:nnoremap <Leader>c :set cursorcolumn!<CR>

" Set up custom mappings
map <C-n> :NERDTreeToggle<CR>
map <C-l> :NERDTreeToggle<CR>
nmap <C-p> :Files<CR>
nmap <C-g> :Ag<CR>
nmap <Leader>r :tags<CR>
" clear search highligts (noh), quickfix list (ccl), location list (lcl)
" and preview window (pclose)
nmap <Leader>c :noh <bar> ccl <bar> lcl <bar> pclose<CR>
" Map leader+n to go to the next location in the location list, and N to
" go to previous
nnoremap <Leader>n :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
nnoremap <Leader>N :try<bar>lprev<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>llast<bar>endtry<cr>

" Set up space to toggle folding (when enabled)
nnoremap <Leader>f za
nnoremap <Leader>t :TagbarToggle<CR>

if has('nvim')
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " managing terminal in vim

  " jump to terminal
  nnoremap <M-1> :b term://<CR>

  " enter normal mode from within terminal
  tnoremap <Esc> <C-\><C-n>

  " send a literal escape to a program in the terminal
  tnoremap <M-0> <Esc>
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
endif

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

syntax on
filetype plugin indent on

" clean up trailing whitespace
autocmd BufWrite * let position = winsaveview() | :%s/\s\+$//e | call winrestview(position) | unlet! position
"autocmd BufWrite *.py let savedview = winsaveview() | :norm gggqG<CR> | call winrestview(savedview) | unlet! savedview
"autocmd BufWrite * :Autoformat
"autocmd BufWritePre *.py let position = winsaveview() | :%!autopep8 --aggressive --aggressive - | call winrestview(position) | unlet! position
"let g:formatterpath = ['/Users/jack/.pyenv/shims/']

" set the tags search path to look in the .git folder (as configured via git
" hooks
set tags=.git/tags,./tags,tags
nnoremap <silent> [[ :bprevious<CR>
nnoremap <silent> ]] :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <F8> gggqG
nnoremap <F9> :!%:p<Enter>
nnoremap <F10> :! docker build -f % .<Enter>
nnoremap Q <Nop>


autocmd FileType go,systemd setlocal
      \ nolist
      \ noexpandtab

autocmd FileType python setlocal formatprg=autopep8\ -
autocmd FileType python setlocal
      \ foldmethod=indent
      \ tabstop=4
      \ softtabstop=4
      \ shiftwidth=4
      \ textwidth=101

au BufReadPost Dockerfile* set syntax=dockerfile
au BufReadPost *.tpl set syntax=yaml
au BufReadPost *.yml.template set syntax=yaml
au BufReadPost template.yaml set syntax=yaml.cloudformation
au BufWrite *.dot GraphvizCompile

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
