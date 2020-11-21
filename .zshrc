export CLICOLOR=1

brewsky() {
	brew upgrade
	brew upgrade --cask
	brew cleanup
	brew doctor
	npm update -g
	npm doctor
}

alias fx='whence -pm \* | xargs -L 1 basename | grep -Fi'

f() { find -L . -iname "*$1*"; }

if command -v rg >/dev/null; then
	alias a='rg -Fi --hidden'
else
	a() { grep -Finr "$@" .; }
fi


alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -alF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt PROMPT_SUBST
bindkey -e

PROMPT='%(?..%F{red}%Bexit: %?%b%f
)%n%F{green}%B@%b%f%m%F{green}%B:%b%f%~ %F{red}%B$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%b%f
%F{green}%B%#%b%f '
