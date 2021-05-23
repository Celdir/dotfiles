#!/bin/bash

# install packages
sudo pacman -S --no-confirm --needed neovim rxvt-unicode make gcc feh xbindkeys dzen2 conky

# neovim setup
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/colors/apprentice.vim --create-dirs \
       https://raw.githubusercontent.com/romainl/Apprentice/master/colors/apprentice.vim'
nvim --headless +PlugInstall +qall

# install dwm
cd ~/.config/dwm
sudo make; sudo make install
