# Zsh AI Agent Welcome Message

A personalized welcome message for Zsh terminal sessions that displays the current date/time and available CLI AI agents.

![GitHub](https://img.shields.io/github/license/kevinmhk/zsh-ai-agent-welcome-message)
![GitHub last commit](https://img.shields.io/github/last-commit/kevinmhk/zsh-ai-agent-welcome-message)

## Features

- Personalized greeting with current date and time
- Automatic detection of installed CLI AI agents:
  - Aider
  - Claude
  - Codex
  - Gemini
  - Qwen
- Color-coded output optimized for dark theme terminals
- Non-intrusive and informative

<!--
## Preview

![Welcome Message Preview](https://placehold.co/600x200?text=Welcome+Message+Preview+Image)

*Note: Replace the placeholder above with an actual screenshot of the welcome message.*
-->

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/zsh-ai-agent-welcome-message.git
   ```

2. Copy the script to a convenient location:
   ```bash
   mkdir -p ~/.local/bin
   cp zsh_welcome.sh ~/.local/bin/
   chmod +x ~/.local/bin/zsh_welcome.sh
   ```

3. Add the script to your `.zshrc` file:
   ```bash
   echo "~/.local/bin/zsh_welcome.sh" >> ~/.zshrc
   ```

4. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

## Customization

You can customize the colors by modifying the color code variables at the top of the script:

```bash
BLUE='\033[38;5;39m'      # Bright blue
GREEN='\033[38;5;46m'     # Bright green
CYAN='\033[38;5;51m'      # Bright cyan
MAGENTA='\033[38;5;201m'  # Bright magenta
YELLOW='\033[38;5;226m'   # Bright yellow
ORANGE='\033[38;5;208m'   # Orange
RESET='\033[0m'           # Reset to default color
```

## Future Improvements

See [future_improvement.md](future_improvement.md) for planned enhancements, including:
- Message of the Day (MOTD) feature to limit display frequency
- File-based timestamp tracking
- Zsh hooks implementation

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

<!--
## Contact

Your Name - [@your_twitter](https://twitter.com/your_twitter) - your-email@example.com

Project Link: [https://github.com/kevinmhk/zsh-ai-agent-welcome-message](https://github.com/kevinmhk/zsh-ai-agent-welcome-message)
-->
