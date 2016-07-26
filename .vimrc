" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rstacruz/sparkup'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'

set nocompatible

set runtimepath^=~/.vim/bundle/ctrlp.vim


" ctrlp ignore path's
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

filetype off
filetype indent on
filetype plugin on

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
set showmatch

" damn swap files
set noswapfile

set visualbell

"big fat line
set cursorline

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" More natural split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" More natural tab navigation
nnoremap <S-C-H> <Esc>:tabp<CR>
nnoremap <S-C-L> <Esc>:tabn<CR>

"Map ctrl + s to save
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

set smartindent
set number

set tabstop=2       " The width of a TAB is set to 2.
                   " Still it is a \t. It is just that
                   " Vim will interpret it to be having
                   " a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" Various syntax highlighting  for Vim
syntax enable
syntax on

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

"colors
hi TabLineSel ctermfg=Red ctermbg=Yellow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
