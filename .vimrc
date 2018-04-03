call plug#begin('~/.vim/plugged')

" -------Plugins-------
Plug 'VundleVim/Vundle.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'rstacruz/sparkup'
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
"Plug 'Valloric/YouCompleteMe'
" Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
" Plug 'vim-ruby/vim-ruby'
Plug 'darthmall/vim-vue'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'kchmck/vim-coffee-script'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'agude/vim-eldar'
" Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/vim-auto-save'
Plug 'lifepillar/vim-mucomplete'
Plug 'chr4/nginx.vim'
Plug 'vim-airline/vim-airline'
"----------------------

call plug#end()


filetype indent on
filetype plugin on

set nocompatible
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set smartcase
" add global flag in search by default
set gdefault
" find as you are typing
set incsearch
" show matching ( { } ) etc
"
set showmatch
set noswapfile
set visualbell

"big fat line
set cursorline

set smartindent
set number

let g:auto_save = 1

" set leader to ,
let mapleader = ","

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" More natural tab navigation
" nnoremap <S-C-H> <Esc>:tabp<CR>
" nnoremap <S-C-L> <Esc>:tabn<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"Map ctrl + s to save
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

"Natural escaping
imap jk <esc>
imap kj <esc>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


"REPLACED BY vim-sleuth
"Softtabs, 2 spaces
"set tabstop=2       " The width of a TAB is set to 2.
"                    " Still it is a \t. It is just that
"                    " Vim will interpret it to be having
"                    " a width of 2.
"set shiftwidth=2    " Indents will have a width of 2
"set softtabstop=2   " Sets the number of columns for a TAB
"set expandtab       " Expand TABs to spaces

if has('syntax')
		syntax on
    syntax enable             " Turn on syntax highlighting
    silent! colorscheme eldar " Custom color scheme
endif


" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>


"====================================================
"=      Buffer specific config                      =
"====================================================
set hidden
"To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"exit the current buffer without killing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>


"====================================================


"====================================================
"=        Plugin specific config                    =
"====================================================

"Nerdtree
"autostart Nerdtree with vim without a path (vim .)
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>


"mucomplete
set completeopt+=menuone
" inoremap <expr> <c-e> mucomplete#popup_exit("\<c-e>")
" inoremap <expr> <c-y> mucomplete#popup_exit("\<c-y>")
" inoremap <expr>  <cr> mucomplete#popup_exit("\<cr>")
set completeopt+=noselect
set shortmess+=c
let g:mucomplete#enable_auto_at_startup = 1

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"ctrl-p
" set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"
"FZF
nmap <C-p> :FZF<CR>

"====================================================
