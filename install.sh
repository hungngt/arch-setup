#!/bin/bash

pacman -S firefox bspwm sxhkd vim neovim dunst kitty rofi thunar thunar-archive-plugin lxappearance-gtk3 xarchiver zathura ntfs-3g intel-ucode pulseaudio papirus-icon-theme light

cp -r .config ~/.config
cp .xinitrc .Xresource .vimrc ~/