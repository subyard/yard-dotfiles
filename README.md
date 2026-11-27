# yard-dotfiles

Dotfiles for Subyard yards. Subyard's `user-dotfiles` profile clones this repository into
`~/.local/share/subyard-user-dotfiles/subyard/yard-dotfiles` and runs `install.sh` once, the
way GitHub Codespaces and VS Code Dev Containers install dotfiles; disabling the profile runs
`uninstall.sh` and keeps the clone.

- `install.sh` links `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` and
  `~/.config/opencode/AGENTS.md` to `agents/AGENTS.md`. It is safe to run again and never
  replaces a file or link it did not make: it leaves such a path in place, names it and exits 1.
- `uninstall.sh` removes only the links that still point into the clone. It never changes files
  in the clone, so uncommitted edits survive; a path that holds anything else is left in place
  with a warning.

Linked instructions follow the clone: after `git pull` agents read the new text from their next
session. Run `./install.sh` again after a pull that changes what it links.
