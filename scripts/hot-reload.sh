#!/usr/bin/env bash

LOCKFILE="/tmp/tmux_hot_reload.lock"

exec 200>$LOCKFILE
if ! flock -n 200; then
    exit 0
fi

WATCHED_FILE="$HOME/.config/tmux/themes/noctalia.conf"
TMUX_CONF="$HOME/.config/tmux/tmux.conf"

LAST_MTIME=$(stat -c %Y "$WATCHED_FILE" 2>/dev/null || echo 0)

while true; do
  sleep 2
  CURRENT_MTIME=$(stat -c %Y "$WATCHED_FILE" 2>/dev/null || echo 0)
  
  if [ "$CURRENT_MTIME" -ne "$LAST_MTIME" ]; then
    tmux source-file "$TMUX_CONF"
    LAST_MTIME="$CURRENT_MTIME"
  fi
done
