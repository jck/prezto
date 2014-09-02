#
# Defines systemctl and journalctl aliases.
#
# Authors:
# Keerthan Jaic <jckeerthan@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[systemctl] )); then
  return 1
fi

#
# Aliases
#

#System services
alias sc='systemctl'

alias scst='sudo systemctl status'
alias scs='sudo systemctl start'
alias scS='sudo systemctl stop'
alias scr='sudo systemctl restart'

alias scdr='sudo systemctl daemon-reload'
alias sce='sudo systemctl enable'
alias scd='sudo systemctl disable'

# User services
alias usc='systemctl --user'

alias uscst='systemctl --user status'
alias uscs='systemctl --user start'
alias uscS='systemctl --user stop'
alias uscr='systemctl --user restart'

alias uscdr='systemctl --user daemon-reload'
alias usce='systemctl --user enable'
alias uscd='systemctl --user disable'

# System logs
alias jc='sudo journalctl'
alias jcfu='sudo journalctl -f -u'

