#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'


#
# Functions
#

#url shortener
qnd() {
  res=$(curl -s -X POST -H "Authorization: Bearer ${2}" -d "$1" https://qnd.be)
  echo "${res}" | xclip -selection clipboard
  echo "${res}"
}
qndelete() {
  curl -X DELETE -H "Authorization: Bearer ${2}" -d "$1" https://qnd.be
}

#env
export LPDEST="Kyocera_FS-1370DN" # Printer

#docker
alias dups="docker-compose up"
alias dup="docker-compose up -d"
alias dop="docker-compose stop"
alias dwn="docker-compose down"

#vpn
alias vup="sudo wg-quick up rune"
alias vop="sudo wg-quick down rune"

#default editor
export VISUAL="nvim"

#copy
alias c="xclip -selection clipboard"


#server
alias legacysvr="ssh -p 69 -i ~/.ssh/id_rsa rune@qnd.be"
alias svr="mosh rune@qnd.be --ssh='ssh -p 69 -i ~/.ssh/id_rsa'"
alias svrsftp="sftp -P 69 -i ~/.ssh/id_rsa rune@qnd.be"

#get ip
alias getIP="curl ifconfig.me"

#vscodium
alias code="codium"

#ls and cd
cdl() {
  cd $1 && exa
}

#gopath to path
export PATH=~/go/bin:$PATH

#scripts to path
export PATH=~/stuff/scripts/bin:$PATH

#goto https://github.com/iridakos/goto
source ~/stuff/scripts/goto.sh

#up https://github.com/shannonmoeller/up
source ~/stuff/scripts/up.sh

#prompt
#export PS1="\[\e[0;34m\]\w\n\[\e[0;32m\]λ\[\e[0m \]"
eval "$(starship init bash)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
