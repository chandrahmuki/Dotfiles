#!/bin/bash

menu() {
  echo -e "🔴  Shutdown\n🔄  Reboot\n🚪  Logout" | walker --dmenu --theme power -p "Power:"
}

case "$(menu)" in
"🔴  Shutdown")
  confirm=$(echo -e "✅ Yes\n❌ No" | walker --dmenu --theme power -p "Shutdown?")
  [[ "$confirm" == "✅ Yes" ]] && systemctl poweroff
  ;;
"🔄  Reboot")
  confirm=$(echo -e "✅ Yes\n❌ No" | walker --dmenu --theme power -p "Reboot?")
  [[ "$confirm" == "✅ Yes" ]] && systemctl reboot
  ;;
"🚪  Logout")
  confirm=$(echo -e "✅ Yes\n❌ No" | walker --dmenu --theme power -p "Logout?")
  [[ "$confirm" == "✅ Yes" ]] && loginctl terminate-user "$USER"
  ;;
esac
