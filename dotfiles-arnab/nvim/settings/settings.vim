syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
" set nu
set nowrap
set smartcase
set ignorecase
set hidden
set hlsearch
set noswapfile
set incsearch
set nobackup
set undodir=~/.vim/undodir
set nowritebackup
set mouse=a
set colorcolumn=80
" set ttyfast  " this is the 21st century, people
highlight ColorColumn ctermbg=0 guibg=lightgrey
" yank in vim and then paste to other programs
set clipboard+=unnamedplus
set number
set splitright
set splitbelow
let mapleader=" "
let g:mapleader=" "
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set relativenumber
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" let base16colorspace=256  
" highlight CursorLineNr cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=#ffffff guifg=#d7000

source $HOME/.config/nvim/settings/mappings.vim
