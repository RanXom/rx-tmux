#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_PATH="$CURRENT_DIR/../scripts"

source "$SCRIPTS_PATH/theme.sh"

tmux set -g status-left-length 80
tmux set -g status-right-length 150

# Core styles
tmux set -g mode-style "fg=${THEME[bgreen]},bg=${THEME[bblack]}"

tmux set -g message-style \
  "bg=${THEME[blue]},fg=${THEME[background]}"

tmux set -g message-command-style \
  "fg=${THEME[blue]},bg=${THEME[bblack]}"

tmux set -g pane-border-style \
  "fg=$(get_option @noctalia_outline_variant)"

tmux set -g pane-active-border-style \
  "fg=${THEME[blue]}"

tmux set -g pane-border-status off

tmux set -g status-style \
  "bg=default"

tmux set -g popup-border-style \
  "fg=$(get_option @noctalia_outline)"

# Defaults
default_terminal_icon=""
default_active_terminal_icon=""
default_prefix_background_color="${THEME[blue]}"

# Session / left side
tmux set -g status-left \
"#[fg=${THEME[background]},bg=${THEME[blue]},bold] \
#{?client_prefix,#[bg=${default_prefix_background_color}]󰠠 ,#[dim]󰤂 }\
#[bold,nodim]#S "

# Window styling

# Focused window
tmux set -g window-status-current-format \
"$RESET#[fg=${THEME[blue]},bg=${THEME[bblack]}] \
#{?#{==:#{pane_current_command},ssh},󰣀 , }\
#[fg=${THEME[foreground]},bold,nodim]#I:#W "

# Unfocused windows
tmux set -g window-status-format \
"$RESET#[fg=${THEME[foreground]}] \
#{?#{==:#{pane_current_command},ssh},󰣀 , }\
#I:#W "

tmux set -g window-status-separator ""

# Temporary right side
tmux set -g status-right \
"#[fg=${THEME[foreground]},bg=${THEME[bblack]}]  #(whoami)@#H "
