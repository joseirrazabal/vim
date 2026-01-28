# Configuracion

Este repo guarda toda la configuracion personal. Todo vive dentro de `.configuracion` y el home solo
tiene links simbolicos.

## Instalacion

Desde la raiz del usuario:

```bash
git clone https://github.com/joseirrazabal/vim .configuracion
sh .configuracion/scripts/install.sh
```

Cuando entras a vim, se instalan los plugins.

## Estructura

- `shell/` zshrc, zshenv, exports, aliases, functions, antigen
- `tmux/` tmux.conf, kube.tmux, right_status.sh
- `vim/` vimrc
- `nvim/` configuracion de Neovim
- `git/` gitconfig
- `scripts/` helpers (install, touch)
- `bin/` scripts personales
- `completion/` completions zsh
