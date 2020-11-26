# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

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

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# FOR FLUTTER APPDEV
export PATH="$PATH:/home/shashankmoghe/Downloads/flutter/bin:/home/shashankmoghe/Downloads/android-studio/bin"

# FOR ANDROID SCREEN SHARE WITH SCRCPY
alias ss="setsid scrcpy &>/dev/null"

alias android-studio="~/Downloads/android-studio/bin/studio.sh"

# FOR GO
export PATH=$PATH:/usr/local/go/bin

# FOR CORDLESS
alias cordless="~/.cache/cordless/cordless"

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  virtualenv
)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=false
source /opt/ros/melodic/setup.zsh
alias tk="rosrun teleop_twist_keyboard teleop_twist_keyboard.py"
alias e="clear; exit"

# FOR ROS
# source ~/projects/eyantra-ros/catkin_ws/devel/setup.zsh
# source ~/catkin_ws/devel/setup.zsh
# source ~/projects/soham-eyantra/catkin_ws/devel/setup.zsh
source ~/projects/ros-urdf-basics/devel/setup.zsh

