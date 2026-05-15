#!/bin/bash
set -e

echo "==> Installing packages..."
sudo pacman -S --needed git tmux vim zsh curl fzf the_silver_searcher base-devel openssh wayland cairo pango json-c libxkbcommon glib2 librsvg wayland-protocols

echo "==> Creating directories..."
mkdir -p ~/.local/share/zsh/antigen
mkdir -p ~/.tmux/plugins

echo "==> Symlinking config files..."
ln -sfn ~/.configuracion/vim/vimrc ~/.vimrc
ln -sfn ~/.configuracion/tmux/tmux.conf ~/.tmux.conf
ln -sfn ~/.configuracion/shell/zshrc ~/.zshrc
ln -sfn ~/.configuracion/shell/zshenv ~/.zshenv
ln -sfn ~/.configuracion/shell/exports.zsh ~/.exports.zsh
ln -sfn ~/.configuracion/shell/aliases.zsh ~/.aliases.zsh
ln -sfn ~/.configuracion/shell/functions.zsh ~/.functions.zsh
ln -sfn ~/.configuracion/shell/antigen.zsh ~/.antigen.zsh
ln -sfn ~/.configuracion/git/gitconfig ~/.gitconfig

echo "==> Downloading antigen..."
if [ -f "$HOME/.configuracion/shell/antigen.zsh" ]; then
  echo "antigen.zsh already exists"
else
  curl -fsSL https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh -o "$HOME/.configuracion/shell/antigen.zsh"
fi

echo "==> Installing tmux plugins (TPM)..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "==> Installing system configs..."
if [ -d ~/.configuracion/system ]; then
  for dir in ~/.configuracion/system/*/; do
    name=$(basename "$dir")
    echo "  - $name"
    mkdir -p ~/.config/$name
    cp -rn "$dir"*.toml "$dir"*.ini "$dir"*.conf ~/.config/$name/ 2>/dev/null || true
  done
fi

echo "==> Installing scripts..."
if [ -d ~/.configuracion/bin ]; then
  mkdir -p ~/.local/bin
  for f in ~/.configuracion/bin/omarchy-*; do
    name=$(basename "$f")
    echo "  - $name"
    cp "$f" ~/.local/bin/"$name"
  done
fi

echo "==> Installing patched snappy-switcher..."
tmpdir=$(mktemp -d)
git clone --depth 1 --branch v3.1.0 https://github.com/OpalAayan/snappy-switcher.git "$tmpdir/snappy-switcher"
(
  cd "$tmpdir/snappy-switcher"
  patch -p1 < ~/.configuracion/patches/snappy-switcher-current-workspace.patch
  make
  make install-user
)
rm -rf "$tmpdir"

echo "==> Removing conflicting tmux config..."
if [ -f ~/.config/tmux/tmux.conf ]; then
  mv ~/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf.bak
  echo "  backed up tmux.conf"
fi

echo "==> Setting default shell to zsh..."
chsh -s /bin/zsh

echo ""
echo "==> Done!"
echo "==> Restart your terminal to apply changes."
echo "==> In tmux, press 'prefix + I' to install plugins."
