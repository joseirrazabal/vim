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

function nvims() {
  items=("default" "joseNvim" "LazyNvim" "AstroNvim" "adalessaNvim" "VapourNvim" "PojoNvim" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# bindkey -s ^a "nvims\n"
# bindkey \ca nvims
