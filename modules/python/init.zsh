#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH.
else
  if [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

local venv_script=virtualenvwrapper
if zstyle -T ':prezto:module:python' lazy_venv; then
    venv_script+=_lazy
fi

# Load virtualenvwrapper into the shell session.
if (( $+commands[$venv_script.sh] )); then
  # Set the directory where virtual environments are stored.
  export WORKON_HOME="$HOME/.virtualenvs"

  # Disable the virtualenv prompt.
  VIRTUAL_ENV_DISABLE_PROMPT=1

  source "$commands[$venv_script.sh]"
fi

#
# Aliases
#

alias py='python'

