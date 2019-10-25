# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=** l:|=*'
zstyle ':completion:*' menu select=2
# zstyle ':completion:*' menu select=interactive # no funciona avanzar con flechas
zstyle :compinstall filename '$HOME/.zshrc'

# custon zsh funcs (kubens kubectx autocomplete)
fpath=(~/.configuracion/completation $fpath)

autoload -Uz compinit && compinit
# End of lines added by compinstall

# ZSH SPECIFIC
setopt AUTOCD EXTENDEDGLOB NOTIFY PROMPT_SUBST MAGIC_EQUAL_SUBST AUTO_NAME_DIRS CORRECTALL
bindkey -e
autoload -Uz promptinit && promptinit

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# FUNCTIONS
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)        tar xjf $1        ;;
      *.tar.gz)         tar xzf $1        ;;
      *.bz2)            bunzip2 $1        ;;
      *.rar)            unrar x $1        ;;
      *.gz)             gunzip $1         ;;
      *.tar)            tar xf $1         ;;
      *.tbz2)           tar xjf $1        ;;
      *.tgz)            tar xzf $1        ;;
      *.zip)            unzip $1          ;;
      *.Z)              uncompress $1     ;;
      *.7z)             7zr e $1          ;;
      *)                echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function compress() {
  dirPriorToExe=`pwd`
  dirName=`dirname $1`
  baseName=`basename $1`

  if [ -f $1 ] ; then
    echo "It was a file change directory to $dirName"
    cd $dirName
    case $2 in
      tar.bz2)
        tar cjf $baseName.tar.bz2 $baseName
        ;;
      tar.gz)
        tar czf $baseName.tar.gz $baseName
        ;;
      gz)
        gzip $baseName
        ;;
      tar)
        tar -cvvf $baseName.tar $baseName
        ;;
      zip)
        zip -r $baseName.zip $baseName
        ;;
      *)
        echo "Method not passed compressing using tar.bz2"
        tar cjf $baseName.tar.bz2 $baseName
        ;;
    esac
    echo "Back to Directory $dirPriorToExe"
    cd $dirPriorToExe
  else
    if [ -d $1 ] ; then
      echo "It was a Directory change directory to $dirName"
      cd $dirName
      case $2 in
        tar.bz2)
          tar cjf $baseName.tar.bz2 $baseName
          ;;
        tar.gz)
          tar czf $baseName.tar.gz $baseName
          ;;
        gz)
          gzip -r $baseName
          ;;
        tar)
          tar -cvvf $baseName.tar $baseName
          ;;
        zip)
          zip -r $baseName.zip $baseName
          ;;
        *)
          echo "Method not passed compressing using tar.bz2"
          tar cjf $baseName.tar.bz2 $baseName
          ;;
      esac
      echo "Back to Directory $dirPriorToExe"
      cd $dirPriorToExe
    else
      echo "'$1' is not a valid file/folder"
    fi
  fi
  echo "Done"
  echo "###########################################"
}

# ANTIGEN
antigen_source="$HOME/antigen.zsh"

# CONFIG POWER FONT
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="blue"

POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="249"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="249"

POWERLEVEL9K_OS_ICON_BACKGROUND="black"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='blue'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_NODE_VERSION_BACKGROUND="249"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="black"
POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_COLOR="white"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir_writable dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs node_version)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

function anti_init() {
  . $antigen_source
  antigen use oh-my-zsh
  antigen theme bhilburn/powerlevel9k powerlevel9k

  antigen bundle git
  antigen bundle pip
  antigen bundle command-not-found
  # antigen bundle shrink-path
  # antigen bundle mvn
  # antigen bundle sbt
  # antigen bundle scala
  # antigen bundle cargo
  antigen bundle docker-compose
  antigen bundle zsh-users/zsh-autosuggestions
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle MichaelAquilina/zsh-autoswitch-virtualenv

  # --------
  antigen bundle sudo
  antigen bundle webyneter/docker-aliases.git
  antigen bundle dijitalmunky/nvm-auto
  antigen bundle lukechilds/zsh-nvm
  # antigen bundle alexrochas/zsh-extract
  antigen bundle gko/ssh-connect
  # --------

  antigen apply
}

if [ -f $antigen_source ]; then
  anti_init
else;
  curl -L git.io/antigen > $antigen_source
  anti_init
fi

# HISTORY
setopt HIST_IGNORE_ALL_DUPS SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_SPACE HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS
HISTFILE=~/.hist_zsh
HISTSIZE=5000000
SAVEHIST=$HISTSIZE
# History end

if test -t 1; then
  force_color_prompt=yes
  color_prompt=yes
  export TERM="xterm-256color"
  # enable color support of ls and also add handy aliases
  alias ls='ls --color=auto'
  alias less='less -R'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# ALIASES
alias arch='uname -m'
alias ll='ls -ahlF --time-style=long-iso'
alias la='ls -A'
alias ~='cd $HOME'

#stern para hacer tail de pods
alias stern=stern_linux_amd64

alias x=extract
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

alias touchpad='sh ~/.configuracion/touch.sh'

# CONDITIONS
SUDO=''
if [[ $EUID -ne 0 ]] && (( $+commands[sudo] )) ; then
  SUDO='sudo'
fi

if (( $+commands[apt] )) ; then
  alias apt="$SUDO apt"
  alias upd='apt update'
  alias upgy='apt upgrade'
  alias upl='apt list --upgradable'
  alias upg='upd && sleep 2 && upl && sleep 2 && upgy'
  alias pacs='apt search'
  alias paci='apt install'
  alias pacr='apt remove'
  alias pql="dpkg-query -L"
  alias aar="$SUDO add-apt-repository"
fi

if (( $+commands[tmux] )) ; then
  alias tm='tmux attach || tmux new'
fi

if (( $+commands[docker] )) ; then
  # Docker
  alias d='docker'
  compdef d='docker'
  alias dc='docker-compose'
  alias dl='docker-compose logs --tail 15'
  alias run='docker-compose stop && docker-compose run --service-ports'
  alias dst='d stop $(d ps -q)'
  alias drm='d rm $(d ps -aq)'
  alias drmin='d rmi $(d images | rg -i "none" | awk "{print $3}")'
  d_exec(){
    docker exec -it $1 sh -c "stty cols $COLUMNS rows $LINES && sh -l";
  }
  export d_exec;
fi

if (( $+commands[kubectl] )) ; then
  # Kubernetes
  alias k='kubectl'
  compdef k='kubectl'

  alias k=kubectl

  # Get commands
  alias kg='kubectl get'
  alias kgp='kubectl get pods'
  alias kgns='kubectl get namespaces'
  alias kgall='kubectl get ingress,service,deployment,pod'

  #Configuration commands
  alias kuc='kubectl config use-context'
  alias ksc='kubectl config set-context "$(kubectl config current-context)"'
  alias kns='ksc --namespace'

  # Networking
  alias kpf='kubectl port-forward '
  alias kp='kubectl proxy'

  if (( $+commands[kubectx] )) ; then
    alias kx='kubectx'
    compdef kx='kubectx'
  fi
  if (( $+commands[kubens] )) ; then
    alias ks='kubens'
    compdef ks='kubens'
  fi
fi

if (( $+commands[systemctl] )) ; then
  alias ssystemctl="$SUDO systemctl"
fi

if [ -f ~/.aliases.zsh ]; then
  . ~/.aliases.zsh
fi

CONFIG_BIN=$HOME/.configuracion/bin
LOCAL_BIN=$HOME/.local/bin
if [ -d $LOCAL_BIN ]; then
  export PATH=$PATH:$LOCAL_BIN:$CONFIG_BIN
fi
