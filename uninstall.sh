#!/usr/bin/env bash
# Remove the links that still point into this clone. Clone files are never touched;
# a path that holds anything else is left in place, and the script exits 1.
set -euo pipefail
clone="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
left=0
for path in .claude/CLAUDE.md .codex/AGENTS.md .config/opencode/AGENTS.md; do
  link="$HOME/$path"
  if [ -L "$link" ]; then
    case "$(readlink -- "$link")" in
      "$clone"/*) unlink -- "$link"; continue ;;
    esac
  fi
  if [ -e "$link" ] || [ -L "$link" ]; then
    printf 'yard-dotfiles: left ~/%s in place: it is not a link into %s\n' "$path" "$clone" >&2
    left=1
  fi
done
exit "$left"
