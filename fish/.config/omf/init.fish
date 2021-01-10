set PATH $HOME/dev_environment_ubuntu/dev-container-ubuntu $PATH

# aliases
alias rm="$HOME/gitstuff/careful_rm/careful_rm.py"

# abbreviatons
abbr -a -g gcsm git commit -v -s -m
abbr -a -g gmod git merge origin/development
abbr -a -g gmom git merge origin/master
abbr -a -g ovpn sudo openvpn ~/tz.ovpn

# autojump
set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
if test -e $AUTOJUMP_PATH
    source $AUTOJUMP_PATH
end

# fzf
set -U FZF_DEFAULT_OPTS "
  --height=100%
  --layout=default
  --preview='bat --color=always {-1}'
  --preview-window=up:60%
"
set -U FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS"
  --color=dark,fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:-1,hl+:#d858fe
  --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b
  --color=spinner:#61afef,header:#61afef,border:#353b45
"

# colors
set -U fish_color_normal normal
set -U fish_color_command d787ff
set -U fish_color_quote 87af5f
set -U fish_color_redirection 5fafaf
set -U fish_color_end ffd787
set -U fish_color_error d75f5f
set -U fish_color_param afafaf
set -U fish_color_comment 767676
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path
set -U fish_color_autosuggestion 767676
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan
