#!/bin/zsh

# Define color codes for better visibility on dark themes
BLUE='\033[38;5;39m'      # Bright blue
GREEN='\033[38;5;46m'     # Bright green
CYAN='\033[38;5;51m'      # Bright cyan
MAGENTA='\033[38;5;201m'  # Bright magenta
YELLOW='\033[38;5;226m'   # Bright yellow
ORANGE='\033[38;5;208m'   # Orange
PURPLE='\033[38;5;129m'   # Purple
RED='\033[38;5;196m'      # Bright red
TEAL='\033[38;5;44m'      # Teal
SILVER='\033[38;5;244m'   # Silver
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
which droid >/dev/null 2>&1 && agents+=("droid")
which gemini >/dev/null 2>&1 && agents+=("gemini")
which opencode >/dev/null 2>&1 && agents+=("opencode")
which pi >/dev/null 2>&1 && agents+=("pi")
which q >/dev/null 2>&1 && agents+=("q")
which qwen >/dev/null 2>&1 && agents+=("qwen")

# Sort agents alphabetically
IFS=$'\n' agents=($(sort <<<"${agents[*]}"))

# Display agents section only if at least one agent is found
if [ ${#agents[@]} -gt 0 ]; then
    echo "${CYAN}May I remind you this box has the following CLI AI agents installed to assist you:${RESET}"
    colored_agents=()
    for agent in "${agents[@]}"; do
        # Color each agent name differently for visual appeal
        case $agent in
            "aider")     colored_agents+=("${GREEN}- ${agent}${RESET}") ;;
            "claude")    colored_agents+=("${MAGENTA}- ${agent}${RESET}") ;;
            "codex")     colored_agents+=("${YELLOW}- ${agent}${RESET}") ;;
            "droid")     colored_agents+=("${TEAL}- ${agent}${RESET}") ;;
            "gemini")    colored_agents+=("${ORANGE}- ${agent}${RESET}") ;;
            "opencode")  colored_agents+=("${PURPLE}- ${agent}${RESET}") ;;
            "pi")        colored_agents+=("${SILVER}- ${agent}${RESET}") ;;
            "q")         colored_agents+=("${RED}- ${agent}${RESET}") ;;
            "qwen")      colored_agents+=("${BLUE}- ${agent}${RESET}") ;;
            *)           colored_agents+=("${CYAN}- ${agent}${RESET}") ;;
        esac
    done
    printf "%b\n" "${(j: :)colored_agents}"
fi
echo ""
