#!/bin/zsh

# Display welcome message with current date and time
echo ""
echo "Welcome back, Mr. Kevin. It is now $(date +"%A, %B %d, %Y at %I:%M %p")."
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
    echo "May I remind you this box has the following CLI AI agents installed to assist you:"
    for agent in "${agents[@]}"; do
        echo "- $agent"
    done
fi
echo ""
