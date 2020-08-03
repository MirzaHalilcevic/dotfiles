set PATH $HOME/dev_environment_ubuntu/dev-container-ubuntu $PATH

alias rm="~/gitstuff/careful_rm/careful_rm.py"
alias lc="colorls -l --sd"

abbr -a -g ovpn sudo openvpn ~/tz.ovpn
abbr -a -g gmom git merge origin/master
abbr -a -g gmod git merge origin/development
abbr -a -g gcsm git commit -v -s -m

if test -f /home/mirza/.autojump/share/autojump/autojump.fish; . /home/mirza/.autojump/share/autojump/autojump.fish; end

set -U FZF_DEFAULT_OPTS "
  --height=100
  --layout=default
  --prompt='﬌ '
  --pointer='›'
  --marker='›'
  --preview='bat --color=always {-1}'
  --preview-window=up
"
set -U FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS"
  --color=dark
  --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef
  --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:-1,hl+:#d858fe
"
set -U FZF_DEFAULT_COMMAND "
  rg --files --glob '!.git/*' --hidden --no-ignore-vcs
"
