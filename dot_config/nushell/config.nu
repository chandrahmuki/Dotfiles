# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

#~/.config/nushell/config.nu
source ~/.cache/carapace/init.nu

source ~/.zoxide.nu

$env.config.show_banner = false

#starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")



# FZF (depuis nu_scripts)
use custom-completions/auto-generate/completions/fzf.nu *



# Helpers (optionnels)
alias zi = zoxide interactive
def cdz [] {
  let d = (ls | where type == "dir" | get name | str join (char nl) | ^fzf | str trim)
  if $d != "" { cd $d }
}


# Fichier ou dossier : si dossier → cd, sinon imprime le chemin
def --env fzf_find_all [] {
  let p = (fd . | ^fzf --no-preview | str trim)
  if $p == "" { return }
  let kind = (ls -a $p | first | get type)
  if $kind == "dir" { cd $p } else { print $p }
}

# Dossiers seulement → cd
def --env fzf_find_dir [] {
  let d = (fd --type d . | ^fzf --no-preview | str trim)
  if $d != "" { cd $d }
}

def fo [] {
  let fzfoutput = fzf --height 60% --layout reverse --border | str trim
  if (not ($fzfoutput | is-empty)) {
    ^explore $fzfoutput
  }
}

alias ytm4a = ^yt-dlp -x --audio-format m4a --audio-quality 0 --embed-thumbnail --add-metadata --embed-metadata --replace-in-metadata title "d+" "" -o "%(artist)s - %(title)s.%(ext)s"
alias archbox = distrobox enter archbox
source $"($nu.home-path)/.cargo/env.nu"
