# Zsh AI Agent Welcome Message

A small Zsh welcome-message project that prints a timestamped greeting and a colorized list of detected CLI AI agents when a new shell session starts.

## Overview

The repository contains two welcome scripts and one installer:

- `scripts/zsh_welcome.sh`: primary Zsh welcome script
- `scripts/welcome.sh`: fallback welcome script
- `scripts/install.sh`: installer that copies both scripts into `~/.local/bin` and updates `~/.zshrc`

The welcome scripts currently check for these agent CLIs when present on `PATH`:

- `aider`
- `claude`
- `codex`
- `droid`
- `gemini`
- `opencode`
- `pi`
- `q`
- `qwen`

## Install

```bash
git clone https://github.com/kevinmhk/zsh-ai-agent-welcome-message.git
cd zsh-ai-agent-welcome-message
./scripts/install.sh
source ~/.zshrc
```

The installer is idempotent. It rewrites a managed block in `~/.zshrc` so repeated runs do not append duplicate startup lines.

## Usage

Open a new Zsh session after installation. The managed startup block will:

1. Run `~/.local/bin/zsh_welcome.sh` when available.
2. Fall back to `~/.local/bin/welcome.sh` if the primary script is missing.

You can also run either script directly:

```bash
~/.local/bin/zsh_welcome.sh
~/.local/bin/welcome.sh
```

## Customization

Edit `scripts/zsh_welcome.sh` and `scripts/welcome.sh` if you want to change:

- greeting text
- detected agent command names
- ANSI color assignments
- output layout

After editing, rerun `./scripts/install.sh` to copy the updated scripts into `~/.local/bin`.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
