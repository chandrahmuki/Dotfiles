#!/usr/bin/env bash
set -euo pipefail

# Récupère tous les fichiers audio avec chemin complet
files=$(find ~/Music -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.m3u" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.m4a" \))

# Associe chaque ligne "titre" → "chemin complet"
selection=$(echo "$files" | awk -F/ '{print $NF "\t" $0}' |
  fzf --with-nth=1 \
    --delimiter='\t' \
    --prompt="🎵 Select music > " \
    --height=50% \
    --layout=reverse)

if [[ -n "$selection" ]]; then
  file=$(awk -F'\t' '{print $2}' <<<"$selection")

  # Kill tous les mpv déjà en cours
  pkill -x mpv || true

  # Lance la nouvelle musique en background
  nohup mpv --no-video "$file" >/dev/null 2>&1 &

  notify-send "🎵 Playing" "$(basename "$file")"
fi
