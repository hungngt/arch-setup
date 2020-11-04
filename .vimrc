" General
set nocompatible
set showcmd
set number relativenumber
set numberwidth=4
set linebreak
set showbreak=+++ 
set textwidth=100
set showmatch
set noswapfile
syntax on
" colorscheme delek
" set visualbell
set encoding=utf-8
set fileencoding=utf-8
 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set shiftwidth=4
set smarttab
set softtabstop=4
 
" Advanced
set ruler
 
set undolevels=1000
set backspace=indent,eol,start

set noshowmode
 
" Generated by VimConfig.com

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf'
Plug 'yggdroot/indentline'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'ap/vim-css-color'
Plug 'farmergreg/vim-lastplace'

" Initialize plugin system
call plug#end()

colorscheme dracula

set ttimeoutlen=20
set laststatus=2
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:rainbow_active = 1
let g:lightline = {
      \ 'colorscheme': 'powerlineish',
      \ }

nnoremap <leader><space> :nohl<cr>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
map <C-n> :NERDTreeToggle<CR>

highlight Normal ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
