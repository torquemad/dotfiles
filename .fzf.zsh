# Setup fzf
# ---------
if [[ ! "$PATH" == *$(which fzf)* ]]; then
  export PATH="${PATH:+${PATH}:}$(which fzf)"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/luigi/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source ${XDG_CONFIG_HOME:-$HOME/.config}/.fzf/shell/key-bindings.zsh
