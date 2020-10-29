# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_DISABLE_COMPFIX=true

# ZSH_THEME="agnoster"
#ZSH_THEME="blinks"
# ZSH_THEME="kolo"
#ZSH_THEME="miloshadzic"
ZSH_THEME="fino-time"
# ZSH_THEME="agnostic"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

EDITOR="vim"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

# User configuration

source $ZSH/oh-my-zsh.sh
source $HOME/zsh/env
source $HOME/zsh/alias

# Vim Keybindings
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward # Get CTRL-R back to search history

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export HTTP_PROXY=server.proxy.vzwcorp.com:9290
export HTTPS_PROXY=server.proxy.vzwcorp.com:9290
export NO_PROXY="registry-1.docker.io/v2,k8s.gcr.io,node.kubernetes.io,github.com"

brew ls zsh-autosuggestions >> source
