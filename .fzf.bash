# Setup fzf
# ---------
if [[ ! "$PATH" == */home/max/.dotfiles/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/max/.dotfiles/.fzf/bin"
fi

eval "$(fzf --bash)"
