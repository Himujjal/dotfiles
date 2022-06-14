# My Dotfiles for Nvim setup

# !! WARNING !! README not updated. Use init.lua and lua stuff

### Pre-Req:

Install the following before you go on to use these configurations:

- [ ] [Linux-only] x-clip (`sudo apt install xclip`) or (`sudo pacman -S xclip`)
- [ ] [NodeJS](https://nodejs.org/en/)
- [ ] [Python3](https://python.org)

### Installation


```sh
# download repo
git clone https://github.com/Himujjal/dotfiles ~/.config/nvim
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo apt install gcc g++ clang-9 # for tree-sitter
nvim +PackerInstall
# --- language serverss -----
pnpm i -g vscode-langservers-extracted \
        graphql-language-service-cli
        svelte-langauge-server
        typescript typescript-language-server
sudo apt-get install clangd-9
```

### Windows Users:

***hello***

Try running the whole thing on nvim-qt or Windows Terminal for a better Vim experience

```sh
nvim-qt ..
```
