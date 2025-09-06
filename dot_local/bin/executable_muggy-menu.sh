#!/bin/bash

# Fonction générique pour afficher un menu avec fuzzel
menu() {
  local prompt="$1"
  local options="$2"
  local preselect="$3"

  if [[ -n "$preselect" ]]; then
    printf "%b" "$options" | fuzzel --config ~/.config/fuzzel/menu.ini --dmenu \
      --prompt "$prompt…" \
      --select "$preselect"
  else
    printf "%b" "$options" | fuzzel --config ~/.config/fuzzel/menu.ini --dmenu \
      --prompt "$prompt…"
  fi
}

# Sous-menu Power
show_power_menu() {
  choice=$(menu "Power" "🔴  Shutdown\n🔄  Reboot\n🚪  Logout")

  case "$choice" in
  "🔴  Shutdown") systemctl poweroff ;;
  "🔄  Reboot") systemctl reboot ;;
  "🚪  Logout") loginctl terminate-user "$USER" ;;
  "") show_tools_menu ;; # ESC = retour Tools
  esac
}

# Menu Tools
show_tools_menu() {
  choice=$(menu "Tools" "  Paru-FZF\n  Neovim Config\n󰓇  Update system\n󰙵  Kill Process\n  Music\n  Power")

  case "$choice" in
  *Paru-FZF*)
    foot --app-id=FloatingMenu ~/.local/bin/pkg_search.sh
    show_tools_menu
    ;;
  *Neovim*)
    foot --app-id=FloatingMenu nvim ~/.config/nvim/init.lua
    show_tools_menu
    ;;
  *Update*)
    foot --app-id=FloatingMenu fish -c "up; notify-send '✅ Update terminé'"
    ;;
  *Kill*)
    foot --app-id=FloatingMenu ~/.local/bin/ps.sh
    ;;
  *Music*)
    foot --app-id=FloatingMenu ~/.local/bin/music.sh \
    ;;
  *Power*)
    show_power_menu
    ;;
  "") exit 0 ;; # ESC = quitter depuis Tools (menu racine)
  esac
}

# Lancer le menu Tools au démarrage
show_tools_menu
