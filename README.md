# My Dotfiles for Nvim setup

### Installation

NOTE: Have NodeJS and Python3 in your path.

```sh
# download repo
git clone https://github.com/Himujjal/dotfiles ~/.config/nvim

# install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +PlugInstall
nvim +CocInstall
```