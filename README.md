# Arch configurations

## Install programs
### [yay](https://github.com/Jguer/yay)
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
### 
	sudo pacman -S base-devel firefox bspwm sxhkd vim neovim dunst kitty rofi thunar thunar-archive-plugin lxappearance-gtk3 xarchiver zathura ntfs-3g intel-ucode pulseaudio papirus-icon-theme light
	yay -S polybar picom-tryone-git betterlockscreen 

### Add user to video group to run `light`
	sudo gpasswd -a $USER video

## [Silent boot](https://wiki.archlinux.org/index.php/Silent_boot)

### Kernel parameters:

    rw quiet loglevel=3 rd.systemd.show_status=auto rd.udev.log_priority=3 i915.fastboot=1

### fsck:

Replace udev with systemd:  
    
    HOOKS=( base systemd fsck ...)  

in `/etc/mkinitcpio.conf`  
    
    sudo mkinitcpio -p linux

    sudo systemctl edit --full systemd-fsck-root.service  
    sudosystemctl edit --full systemd-fsck@.service

        (...)

        [Service]
        Type=oneshot
        RemainAfterExit=yes
        ExecStart=/usr/lib/systemd/systemd-fsck
        StandardOutput=null
        StandardError=journal+console
        TimeoutSec=0
## [Libinput-gestures](https://github.com/bulletmark/libinput-gestures)
    sudo gpasswd -a $USER input
    sudo pacman -S xdotool wmctrl
    yay -S libinput-gestures gestures
    libinput-gestures-setup autostart
    libinput-gestures-setup start
## zsh
    sudo pacman -S zsh
    chsh -s /usr/bin/zsh/
logout
### [Oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
add `plugins=(zsh-autosuggestions)` to `.zshrc`
### [zsh-completions](https://github.com/zsh-users/zsh-completions)
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
add to `.zshrc`
    
    plugins=(… zsh-completions)
    autoload -U compinit && compinit
### [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
add `plugins=( [plugins...] zsh-syntax-highlighting)` to `.zshrc`

## Vim
### [Vim-Plug](https://github.com/junegunn/vim-plug)
#### Vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#### Neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
### Share `.vimrc` config: add to `init.vim`
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath=&runtimepath
    source ~/.vimrc

### [coc.nvim for C/C++](https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/)

## systemd-boot
    bootctl --path=/boot install
    cd /boot/loader
    vim loader.conf
### loader.conf
    timeout 3
    #console-mode keep
    default arch-*
#### Save and quit
    cd entries
    vim arch.conf
### arch.conf
    title Arch Linux
    linux /vmlinuz-linux
    initrd  /initramfs-linux.img
    initrd  /intel-ucode.img
    options root=/dev/vda2 rw 
    
