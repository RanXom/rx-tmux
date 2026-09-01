#!/usr/bin/env bash

# Read all global tmux options once.
TMUX_VARS="$(tmux show-options -g 2>/dev/null)"

get_option() {
  echo "$TMUX_VARS" | awk -v key="$1" '$1 == key {gsub(/"/, "", $2); print $2}'
}

# Build a semantic palette from Noctalia's generated colors.
declare -A THEME=(
  # Base
  ["background"]="$(get_option @noctalia_surface)"
  ["foreground"]="$(get_option @noctalia_on_surface)"

  # Surface hierarchy
  ["black"]="$(get_option @noctalia_surface_container_low)"
  ["bblack"]="$(get_option @noctalia_surface_container_high)"

  # Primary
  ["blue"]="$(get_option @noctalia_primary)"
  ["bblue"]="$(get_option @noctalia_primary)"

  # Secondary
  ["cyan"]="$(get_option @noctalia_on_secondary_container)"
  ["bcyan"]="$(get_option @noctalia_on_secondary_container)"

  # Active accent
  ["green"]="$(get_option @noctalia_primary)"
  ["bgreen"]="$(get_option @noctalia_primary)"

  # Tertiary
  ["magenta"]="$(get_option @noctalia_tertiary_container)"
  ["bmagenta"]="$(get_option @noctalia_on_tertiary_container)"

  # Error
  ["red"]="$(get_option @noctalia_error_container)"
  ["bred"]="$(get_option @noctalia_on_error_container)"

  # Text hierarchy
  ["white"]="$(get_option @noctalia_on_surface)"
  ["bwhite"]="$(get_option @noctalia_on_surface_variant)"

  # Highlight
  ["yellow"]="$(get_option @noctalia_on_tertiary_container)"
  ["byellow"]="$(get_option @noctalia_on_tertiary_container)"
)

# Optional transparency.
TRANSPARENT_THEME="$(get_option @noctalia_status_transparent)"

if [[ "$TRANSPARENT_THEME" == "1" ]]; then
  THEME["background"]="default"
fi

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
