#!/bin/zsh

# Define color codes for better visibility on dark themes
BLUE='\033[38;5;39m'      # Bright blue
GREEN='\033[38;5;46m'     # Bright green
CYAN='\033[38;5;51m'      # Bright cyan
MAGENTA='\033[38;5;201m'  # Bright magenta
YELLOW='\033[38;5;226m'   # Bright yellow
ORANGE='\033[38;5;208m'   # Orange
RESET='\033[0m'           # Reset to default color

# Display welcome message with current date and time
echo ""
echo "${BLUE}Welcome back, Mr. Kevin. It is now $(date +"%A, %B %d, %Y at %I:%M %p").${RESET}"
echo ""

# Check for available AI agents
agents=()
which aider >/dev/null 2>&1 && agents+=("aider")
which claude >/dev/null 2>&1 && agents+=("claude")
which codex >/dev/null 2>&1 && agents+=("codex")
which gemini >/dev/null 2>&1 && agents+=("gemini")
which qwen >/dev/null 2>&1 && agents+=("qwen")

# Display agents section only if at least one agent is found
if [ ${#agents[@]} -gt 0 ]; then
    echo "${CYAN}May I remind you this box has the following CLI AI agents installed to assist you:${RESET}"
    for agent in "${agents[@]}"; do
        # Color each agent name differently for visual appeal
        case $agent in
            "aider")     echo "${GREEN}- $agent${RESET}" ;;
            "claude")    echo "${MAGENTA}- $agent${RESET}" ;;
            "codex")     echo "${YELLOW}- $agent${RESET}" ;;
            "gemini")    echo "${ORANGE}- $agent${RESET}" ;;
            "qwen")      echo "${BLUE}- $agent${RESET}" ;;
            *)           echo "${CYAN}- $agent${RESET}" ;;
        esac
    done
fi
echo ""
