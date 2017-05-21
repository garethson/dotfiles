if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi

if [ -f  ~/dotfiles/.bash_aliases ]; then
    . ~/dotfiles/.bash_aliases
fi

# load dev, but only if present and the shell is interactive
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi
