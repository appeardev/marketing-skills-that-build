# AGENTS.md - marketing-skills-that-build

Mandatory brief for coding agents.

## Dual-remote git (Forgejo ↔ GitHub)

This repo is dual-hosted after Forgejo migration:

- **`origin`** → Jorge's self-hosted Forgejo (`appeardev/...`, host `forgejo-…sslip.io`) — day-to-day local push/pull
- **`github`** → GitHub `appeardev/...` — cloud coding and some production deploys

**Default branch:** `main`

**Rules for agents:**
- When both remotes are reachable: keep `main` on the **same commit** on Forgejo and GitHub:
  `git push origin main && git push github main`
  Verify: `git rev-list --left-right --count origin/main...github/main` → `0 0`
- Cloud coding without Forgejo credentials: push **GitHub only** (`github` or GitHub-as-`origin`), state dual-sync is incomplete, and that a local Mac agent must dual-sync later. Do **not** invent Forgejo tokens or block the ship on Forgejo.
- Agent skill (user-global): `forgejo-sync-remotes` / `/forgejo-sync-remotes`
- Do **not** push deployable work to historical mirrors (`pablo-mirror`, `demo-wasndr`, etc.) unless Jorge asks.
- Do **not** force-push unless Jorge explicitly requests it.

