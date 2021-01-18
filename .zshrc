# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shashank/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

export PATH="${PATH}:${HOME}/.local/bin/"

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# POWERLINE 9K config
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  virtualenv
)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# GPU SETTINGS
# source ~/.config/nvidiasettings


# run neofetch on start
neofetch

# Aliases
alias ss="setsid scrcpy &>/dev/null"
alias e="clear; exit"
alias vim="nvim"
alias jp="setsid jupyter notebook &>/dev/null"
alias kgz="killall gzclient gzserver"

# pywal
# (cat ~/.cache/wal/sequences &)

# ROS (docker)
# alias rc="sudo docker run -it ros:melodic"
# alias rcp="sudo docker ps -l"

# ROS (local)
source /opt/ros/melodic/setup.zsh

# ROS (Project based)
# source ~/projects/ros-urdf-basics/devel/setup.zsh
# source ~/projects/lemons/devel/setup.zsh
source ~/projects/spawnfromyaml/devel/setup.zsh

