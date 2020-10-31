#!/usr/bin/env bash

set -e

export GHQ_ROOT=~/Code

TOOLING_DIR="tooling"
DOTBOT_MODULE_DIR="tooling/dotbot"
DOTBOT_BIN_DIR="bin/dotbot"

cd "$DOT_DIR"
echo "[DOTFILES] Syncing submodules for dotbot plugins"
git -C "$DOTBOT_MODULE_DIR" submodule sync --quiet --recursive
git submodule update --init --recursive "$DOTBOT_MODULE_DIR"

echo "[DOTFILES] Running dotbot cli"
"$DOT_DIR"/tooling/dotbot/bin/dotbot \
  --verbose \
  -d "$DOT_DIR" \
  --plugin-dir tooling/dotbot-brew \
  --plugin-dir tooling/dotbot-ghq \
 "${@}"
