# docker containers
set PATH $HOME/dev_environment/dev-container $HOME/dev_environment/release-container $PATH
set PATH $HOME/dev_environment_ubuntu/dev-container-ubuntu $PATH

# editor
set EDITOR nvim

# bobthefish
set -g theme_display_docker_machine yes
set -g theme_date_format "+%a %H:%M:%S"
set -g theme_date_timezone Europe/Sarajevo
set -g theme_nerd_fonts no
set -g theme_title_display_process yes
set -g theme_display_jobs_verbose yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '↪ '
set -g theme_color_scheme base16-dark

# fzf
source $OMF_CONFIG/base16-default-dark.fish

set -U FZF_DEFAULT_OPTS $FZF_DEFAULT_OPTS"
  --height=100
  --layout=default
  --prompt='↪ '
  --color=bg+:-1
  --preview='bat --color=always {-1}'
  --preview-window=up
"
set -U FZF_DEFAULT_COMMAND "
  rg --files --hidden --no-ignore-vcs
"

# colorls
alias ls="$HOME/.gem/ruby/2.7.0/gems/colorls-1.3.3/exe/colorls"

# git
abbr -a -g gcsm git commit -s -m
