" .vimrc for vim-tiny

""""""""""""""""""""""""""""""""""""setting"""""""""""""""""""""""""""""""""""""

" syntax on
set nocp
set backspace=indent,eol,start

" esc delay
set notimeout
set ttimeout
set ttimeoutlen=50

" indentation
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
set noexpandtab
set smartindent

" highlight
set nohlsearch
set incsearch
set ignorecase
set smartcase
set noinfercase

" etc set
set nowrap
set noshowmode
set shortmess="atToOFI"
set cpoptions="BceFs_"
set nomodeline
set colorcolumn=80

" scroll
set scrolloff=999
set sidescrolloff=7

"""""""""""""""""""""""""""""""""""""remap""""""""""""""""""""""""""""""""""""""

" skill issue
nnoremap H ^
xnoremap H ^
nnoremap L $
xnoremap L $

" han
inoremap <C-c> <esc>!!han<cr><C-l>A
inoremap <C-f> <esc>!!han -o $'\\x0c'<cr><C-l>A


" That's all forks! (from neovim config)
