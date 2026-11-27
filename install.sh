#!/usr/bin/env bash
# Link agents/AGENTS.md as the user instructions of Claude, Codex and OpenCode.
# Idempotent; a path that holds anything else is left in place, and the script exits 1.
set -euo pipefail
clone="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
target="$clone/agents/AGENTS.md"
left=0
for path in .claude/CLAUDE.md .codex/AGENTS.md .config/opencode/AGENTS.md; do
  link="$HOME/$path"
  if [ -L "$link" ] && [ "$(readlink -- "$link")" = "$target" ]; then
    continue
  fi
  if [ -e "$link" ] || [ -L "$link" ]; then
    printf 'yard-dotfiles: left ~/%s in place: it is not a link to %s; move it away and run %s/install.sh again\n' \
      "$path" "$target" "$clone" >&2
    left=1
    continue
  fi
  mkdir -p -- "${link%/*}"
  ln -sT -- "$target" "$link"
done
exit "$left"
