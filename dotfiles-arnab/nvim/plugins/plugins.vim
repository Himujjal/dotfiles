" vim plug stuff
call plug#begin('~/.config/nvim/plugged')
    Plug 'itchyny/vim-cursorword'
    Plug 'luochen1990/rainbow'
    Plug 'Yggdroot/indentLine'
    Plug 'honza/vim-snippets'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'preservim/nerdtree'
    Plug 'tpope/vim-commentary'
    if has('nvim-0.5') && g:is_linux || g:is_mac
        Plug 'ThePrimeagen/vim-apm'
    endif

    " Language Plugins
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'leafgarland/typescript-vim'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'pangloss/vim-javascript'

    " if has('nvim-0.5')
    "     Plug 'nvim-treesitter/nvim-treesitter'
    " endif

    """ themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
call plug#end()

source $NVIM_CONFIG_DIR/plugins/airline.vim
source $NVIM_CONFIG_DIR/plugins/coc.vim
source $NVIM_CONFIG_DIR/plugins/nerdtree.vim
source $NVIM_CONFIG_DIR/plugins/fzf.vim
" if has('nvim-0.5')
"     source $NVIM_CONFIG_DIR/plugins/treesitter.vim
" endif
