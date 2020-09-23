let g:is_win = has('win32') || has('win64')
let g:is_linux = has('unix') && !has('macunix')
let g:is_mac = has('macunix')

" Add XDG_CONFIG_DIR to env vars
if has('gui')
    source $NVIM_CONFIG_DIR/ginit.vim
endif
source $NVIM_CONFIG_DIR/settings/settings.vim
source $NVIM_CONFIG_DIR/plugins/plugins.vim
source $NVIM_CONFIG_DIR/themes/themes.vim
