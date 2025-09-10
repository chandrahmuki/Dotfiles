#source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
starship init fish | source
set -g fish_greeting

fish_add_path ~/.local/bin

source $HOME/.cargo/env.fish


fish_vi_key_bindings
#nvim
set -Ux EDITOR nvim
set -Ux VISUAL nvim

function up
    echo "🔄 Mise à jour de CachyOS..."
    paru -Syu

    echo "🔄 Mise à jour de la Distrobox archbox..."
    distrobox enter archbox -- paru -Syu

    echo "🔄 Mise à jour des Flatpaks..."
    flatpak update -y
end

alias archbox='distrobox enter archbox'

#config yazi 
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
