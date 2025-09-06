# env.nu
#
# Installed by:
# version = "0.106.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.


## ~/.config/nushell/env.nu
$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

##Z quick jump
zoxide init nushell | save -f ~/.zoxide.nu

#adding script lib
$env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | default [] | append ~/.local/share/nu_scripts)

##adding neo as editor 
$env.EDITOR = "nvim"

$env.FZF_DEFAULT_OPTS = "--ansi --preview-window=right:60% --preview 'pistol {}'"

$env.config.completions.algorithm = "Fuzzy"
