#!/bin/bash

# install packages
sudo pacman -S --no-confirm --needed neovim make gcc feh xbindkeys dzen2 conky ttf-liberation-mono-nerd libinput wayland wlroots libxkbcommon wayland-protocols pkg-config xorg-xwayland libxcb libxcb-wm pixman fcft tllist ttf-liberation-mono-nerd swaybg

# neovim setup
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/colors/apprentice.vim --create-dirs \
       https://raw.githubusercontent.com/romainl/Apprentice/master/colors/apprentice.vim'
nvim --headless +PlugInstall +qall

# install dwm
cd ~/.config/dwm
sudo make; sudo make install

# install dwl
cd ~/.config/dwl
sudo make; sudo make install

# install st
cd ~/.config/st
sudo make clean install
