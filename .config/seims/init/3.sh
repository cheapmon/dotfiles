#!/usr/bin/env zsh

# AUR helper
echo "> AUR helper"
rustup default stable
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
echo

# AUR packages
echo "> AUR packages"
paru -S --noconfirm paper-icon-theme i3lock-color i3lock-fancy-rapid-git \
  lightdm-slick-greeter mdr nerd-fonts-jetbrains-mono spotify ttf-scientifica
echo

# oh-my-zsh
echo "> oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo

# SpaceVim
echo "> SpaceVim"
curl -sLf https://spacevim.org/install.sh | bash
echo

# Dotfiles
echo "> Dotfiles"
mkdir $HOME/git
echo "**/*" > $HOME/.gitignore
git clone --bare https://github.com/cheapmon/dotfiles.git $HOME/git/dotfiles
git --git-dir=$HOME/git/dotfiles --work-tree=$HOME checkout -f
source $HOME/.zshrc
$HOME/.config/seims/scripts/dotfiles.sh -g | zsh
$HOME/.config/seims/scripts/dotfiles.sh
echo

# Polybar
echo "> Polybar"
pip install --user dbus-python spotify-cli-linux
mkdir -p $HOME/.local/share/fonts
cd $HOME/.local/share/fonts
wget https://github.com/google/material-design-icons/blob/master/font/MaterialIcons-Regular.ttf?raw=true
wget https://github.com/google/material-design-icons/blob/master/font/MaterialIconsOutlined-Regular.otf?raw=true
wget https://github.com/google/material-design-icons/blob/master/font/MaterialIconsRound-Regular.otf?raw=true
wget https://github.com/google/material-design-icons/blob/master/font/MaterialIconsSharp-Regular.otf?raw=true
wget https://github.com/google/material-design-icons/blob/master/font/MaterialIconsTwoTone-Regular.otf?raw=true
cd

# Desktop
echo "> Desktop"
mkdir $HOME/bg
sudo cp /usr/share/backgrounds/login.png $HOME/bg/bg.png
echo "feh --no-fehbg --bg-fill '$HOME/bg/bg.png'" > $HOME/.fehbg
systemctl enable --now lightdm
echo

# SSH keys, dotfiles remote, .profile
