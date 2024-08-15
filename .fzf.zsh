# Setup fzf
# ---------
if [[ ! "$PATH" == */home/max/.dotfiles/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/max/.local/share/.fzf/bin"
fi

source <(fzf --zsh)
