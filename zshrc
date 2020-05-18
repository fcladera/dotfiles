# Path to your oh-my-zsh configuration.
ZSH=/home/fclad/.local/share/oh-my-zsh
# CACHE_DIR to avoid autoupdate issue
ZSH_CACHE_DIR="/tmp/"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="mh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

#------------------------------------------------------------
# Run tmux only on i3
if [ -z $DISPLAY ]
then
  # Do not enable tmux
  ZSH_TMUX_AUTOSTART=false
  # Automatically startx (i3wm)
  if [ "$(tty)" = "/dev/tty2" ]
  then
    exec startx
  fi
  # echo "NO DISPLAY"
else
  # Automatically start tmux
  ZSH_TMUX_AUTOSTART=true
  # echo "DISPLAY"
fi

# Only autostart once. If set to false, tmux will attempt to
# autostart every time your zsh configs are reloaded.
ZSH_TMUX_AUTOSTART_ONCE=true
# Automatically connect to a previous session if it exists
ZSH_TMUX_AUTOCONNECT=false
# Automatically close the terminal when tmux exits
ZSH_TMUX_AUTOQUIT=true
# Set term to screen or screen-256color based on current terminal support
ZSH_TMUX_FIXTERM=true

#------------------------------------------------------------
# Put the history in home
HISTFILE=~/.zsh_history
SAVEHIST=1000000

#------------------------------------------------------------
# Disable software flow control stuff
stty -ixon

#------------------------------------------------------------
# SSH keys
#
# Start the gpg-agent if not already running
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
  gpg-connect-agent /bye >/dev/null 2>&1
fi
# Set SSH to use gpg-agent
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi
# Set GPG TTY
export GPG_TTY=$(tty)
# # Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

#------------------------------------------------------------
# Ruby configs
export PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin:$HOME/.node/bin

#------------------------------------------------------------
# Go configs
export GOPATH=~/.go
export PATH="$PATH:$GOPATH/bin"

#------------------------------------------------------------
# Matlab path
export MATLABPATH=/opt/matlab/bin
export PATH=$PATH:$MATLABPATH

#------------------------------------------------------------
# Fix QT applications in i3wm
export QT_QPA_PLATFORMTHEME="qt5ct"

#------------------------------------------------------------
# Nvim FTW!
export EDITOR=nvim
alias vim=nvim

#------------------------------------------------------------
# Python stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/python-envs
export PATH=$HOME/.local/bin:$PATH

#------------------------------------------------------------
# Browser for urlscan
export BROWSER="/usr/bin/firefox"

#------------------------------------------------------------
# Init mutt in Volatile directory
alias mutt='pushd ~/Volatile && neomutt && popd'

#------------------------------------------------------------
# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

#------------------------------------------------------------
# YOLO
alias yolo='git commit -m "$(curl -s http://whatthecommit.com/index.txt)"'

#------------------------------------------------------------
# Plugins!
# Which plugins would you like to load? (plugins can be found in
# ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git z gitfast git-extras colored-man-pages colorize pass taskwarrior tmux fzf sbt alias-finder thefuck zsh-autosuggestions zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
setopt magicequalsubst
