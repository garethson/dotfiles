# Path to your oh-my-zsh installation.
export ZSH=/Users/garethduplooy/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gareth-fishy"

HIST_STAMPS="yyyy-mm-dd"
#DISABLE_AUTO_TITLE="true"


plugins=(git zsh-autosuggestions git-it-on)

# User configuration
#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/Users/kevin/bin"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

setopt NO_BEEP
setopt COMPLETE_IN_WORD
setopt auto_pushd
setopt append_history
unsetopt MULTIOS

HISTFILE=~/.zsh_history
SAVEHIST=50000
HISTSIZE=50000

bk() {
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  open "https://buildkite.com/shopify/shopify-branches/builds?branch=${branch_name}" 2> /dev/null
}

typeset WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

alias be='bundle exec'
alias git_rm='git co master && git pull && git co - && git rebase master'
alias git_c="git branch|grep '*'|tr -d '* \n'|pbcopy"
alias git_cm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias gh='gitit branch master'
alias gt='gittower .'
alias rspecof='bundle exec rspec --only-failures'

unalias grb

bindkey "^[k" up-line-or-beginning-search # Up. Press "ctrl+v" in the terminal, the your key to find out the code to put.
bindkey "^[j" down-line-or-beginning-search # Down

export EDITOR=/usr/local/bin/subl
export BUNDLER_EDITOR=/usr/local/bin/subl
export GIT_MERGE_AUTOEDIT=no
export PRY=ohyes
export IM_ALREADY_PRO_THANKS=1
export IM_ALRDY_PR0_AT_WALRUSES_THX=1
export TDD=1
export HEROKU_ORGANIZATION=shopify

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
