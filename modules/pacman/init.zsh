#
# Defines Pacman aliases.
#
# Authors:
#   Benjamin Boudreau <dreurmail@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Tips:
#   https://wiki.archlinux.org/index.php/Pacman_Tips
#

# Return if requirements are not found.
if (( ! $+commands[pacman] )); then
  return 1
fi

#
# Frontend
#

# Get the Pacman frontend.
zstyle -s ':prezto:module:pacman' frontend '_pacman_frontend'

if (( $+commands[$_pacman_frontend] )); then
  alias pacman="$_pacman_frontend"

  if [[ -s "${0:h}/${_pacman_frontend}.zsh" ]]; then
    source "${0:h}/${_pacman_frontend}.zsh"
  fi
else
  _pacman_sudo='sudo '
fi

#
# Aliases
#

# Pacman.
alias pac="${_pacman_frontend}"

# Installs packages from repositories.
alias paci="${_pacman_sudo}${_pacman_frontend} -S"

# Installs packages from files.
alias pacI="${_pacman_sudo}${_pacman_frontend} -U"

# Removes packages and unneeded dependencies.
alias pacx="${_pacman_sudo}${_pacman_frontend} -Rs"

# Removes packages, their configuration, and unneeded dependencies.
alias pacX="${_pacman_sudo}${_pacman_frontend} -Rns"

# Displays information about an installed package.
alias pacq="${_pacman_frontend} -Qi"

# Displays file list of an installed package.
alias pacl="${_pacman_frontend} -Ql"

#Find out which package owns a file.
alias paco="${_pacman_frontend} -Qo"

# Upgrade repo packages
alias pacu="${_pacman_frontend} -Syu"

# Upgrade repo + aur packages
alias pacS="${_pacman_frontend} -Syua"


unset _pacman_{frontend,sudo}

