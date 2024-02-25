# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yesyesbike/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/yesyesbike/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/yesyesbike/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/yesyesbike/.fzf/shell/key-bindings.bash"
