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
plugins=(zsh-autosuggestions zsh-syntax-highlighting)

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


export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
#export CURL_CA_BUNDLE=
export https_proxy=
export http_proxy=
export HTTP_PROXY=
export HTTPS_PROXY=
#export NO_PROXY="registry-1.docker.io/v2,k8s.gcr.io,node.kubernetes.io,npmjs.org"

#export ALL_PROXY=socks5://server.proxy.vzwcorp.com:9290
export http_proxy=http://server.proxy.vzwcorp.com:9290
export https_proxy=http://server.proxy.vzwcorp.com:9290
export HTTP_PROXY=server.proxy.vzwcorp.com:9290
export HTTPS_PROXY=server.proxy.vzwcorp.com:9290
#export NO_PROXY="registry-1.docker.io/v2,k8s.gcr.io,node.kubernetes.io,npmjs.org,homebrew.bintray.com"

# Let pyenv control over shell path
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PATH="/usr/local/opt/curl/bin:$PATH"
