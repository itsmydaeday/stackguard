# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Installed CLIs (gateway host)

- npm → /usr/bin/npm (v10.9.4)
- gh (GitHub CLI) → /usr/bin/gh (v2.46.0)
- codex (AI coding CLI) → /home/ubuntu/.npm-global/bin/codex (codex-cli v0.101.0)
- nmap → /usr/bin/nmap (v7.95)
- gobuster → not installed on gateway host (apt candidate: 3.6.0-1)

### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.
