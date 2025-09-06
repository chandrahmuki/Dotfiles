#!/bin/bash
set -euo pipefail

fzf_args=(
  --multi
  --preview 'pacman -Sii {1} | head -40'
  --preview-label='alt-p: toggle description, alt-j/k: scroll'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --color 'pointer:green,marker:green'
)

pkg_names=$(pacman -Slq | fzf "${fzf_args[@]}")

if [[ -n "$pkg_names" ]]; then
  echo "$pkg_names" | tr '\n' ' ' | xargs sudo pacman -S --noconfirm
  notify-send "✅ Installation terminée (pacman)"
fi
