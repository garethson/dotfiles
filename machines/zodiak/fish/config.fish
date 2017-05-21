source /usr/local/share/chruby/chruby.fish

set -U fish_prompt_pwd_dir_length 0
set -x EDITOR subl
set -x BUNDLER_EDITOR subl

alias be 'bundle exec'
alias rspec 'bundle exec rspec'
alias git_cm 'git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_rm 'git co master COMMAND; git pull COMMAND; git co - COMMAND; git rebase master COMMAND; git push --force origin'
alias git_p "git branch | grep '^\*' | cut -d' ' -f2 | xargs grb publish"
alias git_c "git branch|grep '*'|tr -d '* \n'|pbcopy"

chruby 2.3.1
source /usr/local/share/chruby/auto.fish

function fish_user_key_bindings
  bind \ek up-or-search
  bind \ej down-or-search
end
