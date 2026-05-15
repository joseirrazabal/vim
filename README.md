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
- `system/` configs de escritorio copiadas a `~/.config`
- `patches/` parches reproducibles para herramientas externas

## Hyprland / Omarchy

La config usa `layout = monocle` para que las ventanas tiled ocupen todo el espacio y evita
las reglas globales de maximize que generaban parpadeo al abrir apps.

`Alt+Tab` usa una version parcheada de `snappy-switcher`, instalada en `~/.local/bin`, que
mantiene las miniaturas pero filtra las ventanas al workspace actual.
