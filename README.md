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

Omarchy 4 usa configuracion Lua para Hyprland. La fuente de verdad esta en
`~/.configuracion/system/hypr/*.lua`; `~/.config/hypr/*.lua` debe ser solo links simbolicos.

Links esperados:

```bash
~/.config/hypr/hyprland.lua  -> ~/.configuracion/system/hypr/hyprland.lua
~/.config/hypr/monitors.lua  -> ~/.configuracion/system/hypr/monitors.lua
~/.config/hypr/input.lua     -> ~/.configuracion/system/hypr/input.lua
~/.config/hypr/bindings.lua  -> ~/.configuracion/system/hypr/bindings.lua
~/.config/hypr/looknfeel.lua -> ~/.configuracion/system/hypr/looknfeel.lua
~/.config/hypr/autostart.lua -> ~/.configuracion/system/hypr/autostart.lua
```

La config personal importante:

- `layout = monocle` para que las ventanas tiled ocupen todo el espacio.
- `F1` abre/cierra el scratchpad `magic`.
- `Super+F1` manda la ventana al scratchpad `magic`.
- Gesto horizontal de 3 dedos cambia un solo workspace por swipe (`workspace_swipe_forever = false`).
- Teclado `latam`, scroll natural y `scroll_factor = 0.4`.
- `Super+F` maximiza y `Super+Ctrl+F` fullscreen.
- `Super+L` bloquea la sesion.
- `Super+Ctrl+Alt+P` ejecuta `omarchy-toggle-performance`.
- `Alt+Tab` y `Alt+Shift+Tab` usan `snappy-switcher`.

`Alt+Tab` usa una version parcheada de `snappy-switcher`, instalada en `~/.local/bin`, que
mantiene las miniaturas, filtra ventanas al workspace actual y usa el dispatcher Lua nuevo de
Hyprland para enfocar ventanas.

Parches necesarios para `snappy-switcher`:

- `patches/snappy-switcher-current-workspace.patch`: muestra solo ventanas del workspace actual.
- `patches/snappy-switcher-hyprland-lua-focus.patch`: reemplaza `focuswindow address:...` por
  `hl.dsp.focus({ window = "address:..." })`, necesario en Hyprland/Omarchy nuevo.

Para reconstruirlo manualmente:

```bash
tmpdir=$(mktemp -d)
git clone --depth 1 --branch v3.1.0 https://github.com/OpalAayan/snappy-switcher.git "$tmpdir/snappy-switcher"
cd "$tmpdir/snappy-switcher"
patch -p1 < ~/.configuracion/patches/snappy-switcher-current-workspace.patch
patch -p1 < ~/.configuracion/patches/snappy-switcher-hyprland-lua-focus.patch
make
make install-user
pkill -x snappy-switcher || true
uwsm-app -- ~/.local/bin/snappy-switcher --daemon >/tmp/snappy-switcher.log 2>&1 &
```

Despues de tocar Hyprland:

```bash
hyprctl reload
hyprctl configerrors
```
