#!/usr/bin/env bash
playerctl metadata --follow --format '{{xesam:url}}|{{artist}} - {{title}}' 2>/dev/null |
  while IFS= read -r line; do
    url="${line%%|*}"
    meta="${line##*|}"
    if [[ "$url" == *"music.youtube.com"* ]]; then
      echo "$meta"
    else
      echo ""
    fi
  done
