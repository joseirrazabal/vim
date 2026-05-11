if test -t 1; then
  force_color_prompt=yes
  color_prompt=yes
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

# stern para hacer tail de pods
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

alias touchpad='sh ~/.configuracion/scripts/touch.sh'

# CONDITIONS
SUDO=''
if [[ $EUID -ne 0 ]] && (( $+commands[sudo] )) ; then
  SUDO='sudo'
fi

if (( $+commands[pacman] )) ; then
  alias upd='sudo pacman -Sy'
  alias upg='sudo pacman -Syu'
  alias upgbl='sudo pacman -Syuu'
  alias pacs='pacman -Ss'
  alias paci='sudo pacman -S'
  alias pacr='sudo pacman -R'
  alias pacq='pacman -Q'
  alias pacqi='pacman -Qi'
  alias pacll='pacman -Qdt'
  alias pql="pacman -Ql"
fi

if (( $+commands[tmux] )) ; then
  alias tm='tmux attach || tmux new'
fi

if command -v docker >/dev/null 2>&1 || command -v docker.exe >/dev/null 2>&1; then
  # Docker
  if command -v docker >/dev/null 2>&1; then
    docker_bin=docker
  else
    docker_bin=docker.exe
  fi
  alias d="$docker_bin"
  if [[ "$docker_bin" == docker ]] && (( $+functions[_docker] )); then
    compdef d='docker'
  fi
  alias dst='d stop $(d ps -q)'
  alias drm='d rm $(d ps -aq)'
  alias drmin='d rmi $(d images | rg -i "none" | awk "{print $3}")'
  d_exec(){
    $docker_bin exec -it $1 sh -c "stty cols $COLUMNS rows $LINES && sh -l";
  }
  export d_exec
fi

if (( $+commands[systemctl] )) ; then
  alias ssystemctl="$SUDO systemctl"
fi

alias nvim-lazy="NVIM_APPNAME=LazyNvim nvim"
alias nvim-jose="NVIM_APPNAME=joseNvim nvim"
alias nvim-ada="NVIM_APPNAME=adalessaNvim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-vapour="NVIM_APPNAME=VapourNvim"
alias nvim-pojo="NVIM_APPNAME=PojoNvim"
