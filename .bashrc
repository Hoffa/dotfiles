note() {
    (
        cd ~/code/sync
        printf "🌀 just a sec, pulling changes...\n"
        git pull --rebase
        vim -c 'r!date' -c 'normal i# ' -c 'normal 2o' -c 'normal O' notes.md
        printf "💅 making it pretty...\n"
        prettier --write notes.md
        printf "🌀 checking for any differences...\n"
        if git diff --exit-code; then
            printf "🐣 no changes ¯\_(ツ)_/¯\n"
        else
            printf "🌀 syncing back...\n"
            git commit -am ":cyclone: $(hostname)"
            if git push -u origin master; then
                printf "✅ done!\n"
            else
                printf "👀 remember to push once connected\n"
            fi
        fi
    )
}

brewsky() {
    (
        set -x

        brew update
        brew upgrade
        brew doctor

        npm update -g npm
        npm update -g
        npm doctor

        pip2 install --upgrade pip
        pip3 install --upgrade pip

        pip2 list --outdated
        pip3 list --outdated
    )
}

c() {
    (
        while [ ! -d .git ]; do
            cd ..
        done
        echo "😻 generating ctags in $(pwd)"
        ctags -R
    )
}

export HOMEBREW_INSTALL_CLEANUP=1
export CLICOLOR=1
export VISUAL=vim
export EDITOR=vim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias d='colordiff -u'
alias hg='history | grep'
alias server='python -m SimpleHTTPServer 80'
alias t='date +%s'

alias ga='git add'
alias gba='git branch -a'
alias gcam='git commit -am'
alias gcgrep='git rev-list --all | xargs git grep'
alias gcm='git commit -m'
alias gd='git diff'
alias gds='git diff --staged'
alias gdwd='git diff --word-diff'
alias gl='git log'
alias glg='git log --graph --oneline'
alias gmv='git mv'
alias gp='git pull'
alias gpoh='git push -u origin HEAD'
alias grm='git rm'
alias gs='git status'
alias gsh='git show'
alias gsubreset='git submodule foreach --recursive git checkout . && git submodule update --recursive --init'
alias gu='git remote -v'

if [ "$(uname)" = "Darwin" ]; then
    alias l='ls -lAhFT'
    alias g='rg -Fi'
    alias f='fd -HF'
    alias cloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
else
    alias l='ls -lAhF --color'
    alias g='grep -FHIRin'
    f() { find . -iname "*$1*"; }
fi

HISTTIMEFORMAT='%F %T '
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend

__smiley() { [ "$1" -ne 0 ] && printf "\e[31m$1$\e[0m"; }
__git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    [ ! -z "${branch}" ] && printf " (${branch})"
}
__prompt_command() {
    local STATUS="$?"
    PS1="\u@\h:\w\$(__git_branch) \$(__smiley $STATUS)\n\$ "
}
PROMPT_COMMAND=__prompt_command
