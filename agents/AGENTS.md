# Working agreements

- Build reliable, high-quality software and keep changes scoped to the task.
- Prefer the existing style, tools, and conventions in the repository.
- Treat the active repository as the default scope. Do not inspect unrelated
  directories or personal files unless the task explicitly requires it; if it
  does, state the path and reason first.
- Do not print secrets, tokens, private config, or raw environment values. If
  a check needs a secret, ask Dmitry to run it or report that it could not be
  verified.
- Delete by literal absolute path: no globs, relative paths, variables or
  `$(...)` in `rm` targets.
- `sudo` inside the yard is allowed for yard-local changes. Never act on the
  host (no SSH to the host); ask Dmitry to run host commands and continue with
  the result.
- Follow the project's own commit and pull request rules. Without them, work
  on a branch and open a pull request; never push to the default branch or
  rewrite shared history; use `--force-with-lease` only on your own branch.
  When a task changed files, end with a short suggested commit message: one
  imperative line, plus a brief body only when the "why" is not obvious.
- In commit messages, never mention authors, agents, or models; do not add
  `Co-Authored-By` trailers.
- Before finishing, run the relevant checks when feasible and report anything
  that could not be verified.

## Delegation

- When the client provides subagents, delegate bounded independent work when
  doing so materially improves speed or quality.
- Prefer read-only research or exploration subagents for documentation lookup,
  codebase searches, broad file reading, and other context-heavy work.
- Give each subagent a self-contained prompt with its scope, constraints, and
  expected result; do not assume it can see the parent conversation.
- Avoid parallel write-heavy work when agents could edit overlapping files.
- When per-agent model selection is available, use a faster model for
  mechanical or read-heavy work that does not require top-tier reasoning.
