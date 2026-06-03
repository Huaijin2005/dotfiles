alias ff="fastfetch"
alias python="python3"
alias arch="uname -m"
alias untar='tar -zxvf '
alias tarnow='tar -acf '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

if [ -x "$(command -v trash-put)" ]; then
    alias rm="trash-put"
fi
if [ -x "$(command -v eza)" ]; then
    alias ls="eza -a --color=always --group-directories-first --icons"
fi
if [ -x "$(command -v zoxide)" ]; then
    alias cd="z"
fi

# DEPRECATED:
# alias cat="batcat"
# alias fd="fdfind"
# alias ls="lsd -A --color=auto"
