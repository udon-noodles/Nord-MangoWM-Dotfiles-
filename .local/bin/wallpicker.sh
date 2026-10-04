#!/usr/bin/env bash

WALL_DIR="$HOME/Pictures/Wallpapers"

SELECTED=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | \
    fzf --prompt="Select Wallpaper ❯ " \
        --border=rounded \
        --preview 'chafa -f sixel --size 45x25 --animate no {}' \
        --preview-window=right:60% \
        --layout=reverse)

if [[ -n "$SELECTED" ]]; then
    awww img "$SELECTED" \
        --transition-type grow \
        --transition-pos 0.5,0.5 \
        --transition-step 90 \
        --transition-fps 60 \
        --transition-duration 1.2
fi
