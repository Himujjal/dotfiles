# My Dotfiles for Nvim setup

### Pre-Req:

Install the following before you go on to use these configurations:

- [ ] [Linux-only] x-clip (`sudo apt install xclip`) or (`sudo pacman -S xclip`)
- [ ] [NodeJS](https://nodejs.org/en/)
- [ ] [Python3](https://python.org)

### Installation


```sh
# download repo
git clone https://github.com/Himujjal/dotfiles ~/.config/nvim

# [Unix] install Vim-Plug (https://github.com/junegunn/vim-plug)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# [Windows] Vim-Plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force

nvim +PlugInstall

# CoC Installation
nvim +CocInstall
```

### Windows Users:

Try running the whole thing on nvim-qt or Windows Terminal for a better Vim experience
```sh
nvim-qt ..
```
