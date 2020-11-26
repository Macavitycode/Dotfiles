# Dotfiles

This repo is to help me keep track of the modifications made to ubuntu by me.
I use the i3 window manager and neovim with the dotfiles as mentioned in dotfiles.

## Installs

Some useful programs to be installed

`ranger neovim zathura tree cabal-install compton checkinstall curl feh git
gnome-tweaks cmatrix font-manager fonts-powerline haskell-platform htop kdenlive
nitrogen python3-pip python3-neovim python3-dev python-pip python-dev
python3-venv python-neovim sl snap zsh zsh-syntax-highlighting
zsh-theme-powerlevel9k`

## General

Random tidbits I found important kept here

### Generating a list of manually installed programs in ubuntu

`comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial
-status.gz | sed -n 's/^Package: //p' | sort -u)`

### To use gnome terminal config

To save a config:
`dconf dump /org/gnome/terminal/ > gnome_terminal_settings_backup.txt`

To reset a config:
`dconf reset -f /org/gnome/terminal/`

To load in a saved config:
`dconf load /org/gnome/terminal/ < dotfile/gnome_terminal_settings_backup.txt`

### Random screen flickering on nvidia GPUs

I noticed flickering ocationally while scrolling always in a given area.
This fixed the problem:
`nvidia-settings --assign \
CurrentMetaMode="nvidia-auto-select +0+0 { ForceFullCompositionPipeline = On }"`

