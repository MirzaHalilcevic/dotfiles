# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mirzah/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mirzah/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mirzah/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mirzah/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS="--layout=default --preview-window=noborder --color=dark,fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:-1,hl+:#d858fe,info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef"
export FZF_DEFAULT_COMMAND="rg --files --hidden --no-ignore-vcs"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
