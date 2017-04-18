# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/jose/.oh-my-zsh

ZSH_TMUX_AUTOSTART=true

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="bira"
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

POWERLEVEL9K_OS_ICON_BACKGROUND="blue"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status nvm node_version)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
# POWERLEVEL9K_DISABLE_RPROMPT=true


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(sudo git tmux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
# convenience aliases for editing configs
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ez='vim ~/.zshrc'


zstyle ':completion:*' special-dirs true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# export ALEANI_MYSQL_HOST='aleanidb.cy6598wgfj2k.us-west-2.rds.amazonaws.com'
# export ALEANI_MYSQL_USER='Al34n11d34m3'
# export ALEANI_MYSQL_PASSWORD='sup3r0ch0!'
# export ALEANI_MYSQL_DATABASE='aleanidb'

# web 
export ALEANI_WEB_URL=http://localhost:5000

# back
# export LOGENTRIES_TOKEN='ebca9412-81e9-4079-873f-6557db2febd9'
# export SENTRY_DSN='https://6f99c5cc14b24ecea9a8957c6281e53a:e7f38c50e27b4d709bf9533ed621246a@sentry.io/128198'
# export SENTRY_PUBLIC_DSN='https://6f99c5cc14b24ecea9a8957c6281e53a@sentry.io/128198'

export HOST='127.0.0.1'
export PORT=3000

export ALEANI_MYSQL_HOST='localhost'
export ALEANI_MYSQL_USER='root'
export ALEANI_MYSQL_PASSWORD='holachau'
export ALEANI_MYSQL_DATABASE='aleani'

export NPS_URL='https://implementacion.nps.com.ar/ws.php?wsdl'
export ALEANI_MONGODB_USER='Al34n11d34m3'
export ALEANI_MONGODB_PASSWORD='sup3r0ch0!'
export ALEANI_MONGODB_HOST='ds019956.mlab.com'
export ALEANI_MONGODB_DATABASE='aleanidb'
export ALEANI_MONGODB_PORT=19956
export PORT=5002
export OLA_WS_ENDPOINT='http://52.45.98.202'
export S3_AWS_ACCESS_KEY_ID='AKIAJ26ZCSOGXPQGRPCQ'
export S3_AWS_SECRET_ACCESS_KEY='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'
export S3_AWS_ZONE='sa-east-1'
#export ALEANI_MONGODB_URI='Al34n11d34m3:sup3r0ch0!@ds119998-a0.mlab.com:19998,ds119998-a1.mlab.com:19998/aleanidbprod?replicaSet=rs-ds119998'
export ALEANI_MONGODB_URI='34.195.203.255/dev_aleanidb'
# export ALEANI_MONGODB_URI='Al34n11d34m3:sup3r0ch0!@ds019956.mlab.com:19956/aleanidb'
export HOSTNAME='dev'
export ALEANI_AMAZON_ZONE='us-west-2'
export ALEANI_AMAZON_API_KEY='AKIAJTE6OK4RH53XXNUA'
export ALEANI_AMAZON_API_SECRET='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'

export ALEANI_APICORE_URL='http://localhost:5002/api'
export ALEANI_BACKOFFICE_URL='http://localhost:3000'
export HOSTNAME='dev'

export ALEANI_APICORE_URL='http://localhost:5002/api'
export HOSTNAME='dev'
export ALEANI_AMAZON_ZONE='us-west-2'
export ALEANI_AMAZON_API_KEY='AKIAJTE6OK4RH53XXNUA'
export ALEANI_AMAZON_API_SECRET='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'
export ALEANI_WEB_URL='http://localhost:5000'
export REDIS_HOST='ec2-54-221-228-237.compute-1.amazonaws.com'
export REDIS_PASS='p66ejsned86dk4bo8k9eddsq573'
export REDIS_PORT=11439

export NEMO_WS_ENDPOINT='http://54.89.181.87'
export GOOGLE_MAPS_API_KEY='AIzaSyC52rQK8hA9iE0GQHbKEMG2RHWmRLyKrD4'
