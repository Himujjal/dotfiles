" vim plug stuff
call plug#begin('~/.vim/plugged')
Plug 'itchyny/vim-cursorword'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'rust-lang/rust.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'alaviss/nim.nvim'
Plug 'turbio/bracey.vim', {'do': 'npm i --prefix server'} " plugin for live html editing
"Plug 'prabirshrestha/asyncomplete.vim'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'pnpm i && cd app && pnpm i' }
if has('nvim-0.5') && g:is_linux || g:is_mac
    Plug 'ThePrimeagen/vim-apm'
endif

" Debugger Plugins
Plug 'puremourning/vimspector'

" Language Plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
" vlang support
"Plug 'ollykel/v-vim'

" if has('nvim-0.5')
"     Plug 'nvim-treesitter/nvim-treesitter'
" endif

""" themes
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
call plug#end()

source $HOME/.config/nvim/plugins/airline.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/rust.vim
source $HOME/.config/nvim/plugins/ack.vim
source $HOME/.config/nvim/plugins/markdownhtmljscss.vim
source $HOME/.config/nvim/plugins/asyncomplete_and_nim.vim
source $HOME/.config/nvim/plugins/rainbow.vim
source $HOME/.config/nvim/plugins/debugger.vim
" if has('nvim-0.5')
