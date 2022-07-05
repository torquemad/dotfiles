call plug#begin('~/.vim/plugged')

"====================================================
"=        Plugins                                   =
"====================================================
Plug 'VundleVim/Vundle.vim'

"-- Dependencies
Plug 'nvim-telescope/telescope-fzf-native.nvim' " telescope sorting
Plug 'nvim-lua/plenary.nvim' " telescope.nvim

"-- Quality of life
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'airblade/vim-gitgutter'     " Show git diff
Plug 'vim-airline/vim-airline'
Plug 'pantharshit00/vim-prisma'

Plug 'vim-scripts/vim-auto-save'
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

Plug 'nvim-telescope/telescope.nvim'

Plug 'scrooloose/nerdtree'

"-- Languages and Snytax --
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"-- TS
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'peitalin/vim-jsx-typescript' " TypeScript tsx syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

"-- JS
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'Galooshi/vim-import-js'

"-- Colours
Plug 'agude/vim-eldar'
Plug 'flrnprz/plastic.vim'
Plug 'romainl/Apprentice'
Plug 'NLKNguyen/papercolor-theme'

"-- Themes
Plug 'gruvbox-community/gruvbox'

call plug#end()              " required
filetype plugin indent on    " required

"====================================================
"=        Vim defaults                              =
"====================================================
let mapleader = ","

set nocompatible
set hidden
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
" set ignorecase
" set smartcase
set gdefault
set incsearch
set showmatch
set noswapfile
set nobackup
set visualbell
set cursorline
set smartindent
set number relativenumber
set guicursor=
" set nohlsearch
set signcolumn=yes

set updatetime=50

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"REPLACED BY vim-sleuth
"Softtabs, 2 spaces
" set tabstop=2       " The width of a TAB is set to 2.
"                    " Still it is a \t. It is just that
"                    " Vim will interpret it to be having
"                    " a width of 2.
"set shiftwidth=2    " Indents will have a width of 2
"set softtabstop=2   " Sets the number of columns for a TAB
"set expandtab       " Expand TABs to spaces

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" syntax highlighting and colour scheme
if has('syntax')
    syntax on
    syntax enable             " Turn on syntax highlighting
    " silent! colorscheme plastic " Custom color scheme
    " silent! colorscheme PaperColor
    silent! colorscheme gruvbox
    set background=dark
    set t_Co=256   " This is may or may not needed.
    highlight Normal guibg=none
endif


augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

"====================================================
"=        Navigation + custom binds                 =
"====================================================
"
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" More natural tab navigation
" nnoremap <S-C-H> <Esc>:tabp<CR>
" nnoremap <S-C-L> <Esc>:tabn<CR>

" buffer resizing
nmap <A-l> :vertical resize -4<CR>
nmap <A-h> :vertical resize +4<CR>
nmap <A-k> :resize +4<CR>
nmap <A-j> :resize -4<CR>

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

" bind K to grep word under cursor
nnoremap K :Rg "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ to ripgrep rg fuzzy search
nnoremap \ :Rg<SPACE>

" bind * to highlight search under cursor (requires hlsearch))
nnoremap * *N

nmap <F8> :vertical wincmd f<CR>

"====================================================
"=      Buffer specific config                      =
"====================================================
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

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"====================================================
"=        Neovim specific config                    =
"====================================================
set clipboard+=unnamedplus
set clipboard=unnamed

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

"vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"fzf
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
" nnoremap <silent> <C-o> :Buffers<CR>

"Autosave
let g:auto_save = 1
let g:auto_save_silent = 1

" Close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomcplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

