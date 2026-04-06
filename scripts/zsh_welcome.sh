#!/bin/zsh

# Define color codes for better visibility on dark themes
# Using 256-color palette with harmonious, distinct colors
GREEN='\033[38;5;77m'       # Medium green (aider)
GREEN_2='\033[38;5;46m'     # Bright green (gemini)
CYAN='\033[38;5;51m'        # Bright cyan (claude)
WHITE='\033[38;5;231m'      # Pure white (codex)
VIOLET='\033[38;5;171m'     # Violet/purple (qwen)
ORANGE='\033[38;5;208m'     # Orange (droid)
YELLOW='\033[38;5;226m'     # Bright yellow (opencode)
TEAL='\033[38;5;44m'        # Teal (pi)
BLUE='\033[38;5;75m'        # Soft blue (q)
SILVER='\033[38;5;244m'     # Grey (pi)
RESET='\033[0m'             # Reset to default color

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
        # Color each agent name with their branding colors
        case $agent in
            "aider")     colored_agents+=("${GREEN}- ${agent}${RESET}") ;;      # Green
            "claude")    colored_agents+=("${ORANGE}- ${agent}${RESET}") ;;     # Orange
            "codex")     colored_agents+=("${WHITE}- ${agent}${RESET}") ;;      # White
            "droid")     colored_agents+=("${TEAL}- ${agent}${RESET}") ;;       # Teal
            "gemini")    colored_agents+=("${GREEN_2}- ${agent}${RESET}") ;;    # Medium green
            "opencode")  colored_agents+=("${YELLOW}- ${agent}${RESET}") ;;     # Yellow 226
            "pi")        colored_agents+=("${SILVER}- ${agent}${RESET}") ;;     # Grey
            "q")         colored_agents+=("${BLUE}- ${agent}${RESET}") ;;       # Soft blue
            "qwen")      colored_agents+=("${VIOLET}- ${agent}${RESET}") ;;     # Violet
            *)           colored_agents+=("${CYAN}- ${agent}${RESET}") ;;       # Cyan (fallback)
        esac
    done
    printf "%b\n" "${(j: :)colored_agents}"
fi
echo ""
