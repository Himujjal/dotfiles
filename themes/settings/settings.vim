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

" ----- Reload neovim when config changes -----
" au BufWritePost ~/.config/nvim/*.vim source $HOME/.config/nvim/init.vim
au BufWritePost ~/.config/nvim/**/*.vim source $HOME/.config/nvim/init.vim


" ------ folding -----
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" ------ lox language support -------
au BufNewFile,BufRead *.lox set syntax=javascript
" ------ ek language support --------
au BufNewFile,BufRead *.svx set syntax=svelte
au BufNewFile,BufRead *.ek set syntax=typescript
au BufNewFile,BufRead *.c.txt set syntax=c
au BufNewFile,BufRead *.zzz set syntax=yaml

source $HOME/.config/nvim/settings/mappings.vim
