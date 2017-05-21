alias be='bundle exec'
alias git_cm='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias git_rm='git co master && git pull && git co - && git rebase master && git push --force origin'
alias git_p="git branch | grep '^\*' | cut -d' ' -f2 | xargs grb publish"
alias git_c="git branch|grep '*'|tr -d '* \n'|pbcopy"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tu='be spring testunit'
alias shupdate='git checkout master && git pull && dev up && be rake db:test:prepare && git checkout -'
alias railsupdate='git checkout master && git pull && bundle install && bundle exec rake db:migrate db:test:prepare && git checkout -'
alias vssh='vagrant ssh'

function s_release {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [[ "$branch" =~ "master" ]]; then
      if [[ -z "$1" ]]; then
        echo 'No version given'
      else
        echo "have you updated the version file and changelog? (y/n)"
        read REPLY
        if [[ $REPLY =~ ^[Yy]$ ]]; then
          git add .
          git commit -m "Release v$1"
          git push origin master
          git tag -m "Release $1" "v$1"
          git push --tags origin master
        fi
      fi
    else
      echo 'Can only release on Master branch'
    fi
  else
    echo 'Not a git repo'
  fi
}
