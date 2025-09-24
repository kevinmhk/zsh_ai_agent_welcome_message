# Zsh AI Agent Welcome Message Project

## Project Overview

This project provides a personalized welcome message for Zsh terminal sessions that displays:
1. A customized greeting with the current date and time
2. A list of available CLI AI agents installed on the system

The welcome message is designed with enhanced color support for better visibility on dark theme terminals.

## Key Files

- `welcome.sh` - The main welcome script
- `zsh_welcome.sh` - Zsh-specific welcome script (identical to welcome.sh)
- `setup_instructions.txt` - Setup guide for installing the welcome message
- `future_improvement.md` - Documentation of planned enhancements
- `QWEN.md` - This file (project context for AI assistants)

## Project Type

This is a shell scripting project designed to enhance the terminal experience by providing a personalized welcome message when starting new Zsh sessions.

## Technology Stack

- Zsh shell scripting
- Shell built-ins (`date`, `which`, `echo`)
- ANSI color codes for terminal formatting

## Setup and Installation

To set up the welcome message to appear every time you start a new Zsh session, run the following command:

```bash
echo "~/.local/bin/zsh_welcome.sh" >> ~/.zshrc
```

This will add the script to your .zshrc file so it runs automatically when you start a new terminal session.

## Script Functionality

The welcome script (`zsh_welcome.sh`) performs the following actions:

1. Displays a personalized welcome message with the current date and time
2. Checks for the presence of various CLI AI agents:
   - aider
   - claude
   - codex
   - gemini
   - opencode
   - q
   - qwen
3. Lists any found AI agents with color-coded names
4. Uses enhanced color codes optimized for dark theme terminals

## Future Improvements

Planned enhancements include implementing a "Message of the Day" (MOTD) feature that would limit the welcome message to display only once per day rather than on every shell session. This would involve:

1. File-based timestamp tracking approach
2. Using Zsh hooks (precmd) to check display conditions
3. Better user experience by reducing message frequency

## Development Conventions

- Shell scripts are written for Zsh compatibility
- Color codes are defined as variables at the top of the script for easy modification
- Scripts use proper reset sequences to avoid color bleeding
- Code is organized with clear comments explaining functionality
- Scripts check for command availability before execution

## Usage Notes

- The script is intended to be run automatically when starting new Zsh sessions
- Color codes are optimized for dark theme terminals
- The agent detection is dynamic and will only show agents that are actually installed
- The welcome message is non-intrusive and provides useful information at a glance