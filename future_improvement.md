# Future Improvements for Zsh Welcome Message

## Message of the Day (MOTD) Feature

To enhance the current welcome message system and limit its frequency to once per day (rather than every shell session), consider implementing the following:

### Approach 1: File-Based Timestamp Tracking

Store the last display date in a file and compare it with the current date before showing the message:

```zsh
# Store last display date in ~/.welcome_last
LAST_WELCOME=~/.welcome_last
TODAY=$(date +"%Y-%m-%d")

if [[ ! -f "$LAST_WELCOME" ]] || [[ $(cat "$LAST_WELCOME") != "$TODAY" ]]; then
    # Display welcome message
    ~/.local/bin/zsh_welcome.sh
    # Update last display date
    echo "$TODAY" > "$LAST_WELCOME"
fi
```

### Approach 2: Using Zsh Hooks

Implement using Zsh's `precmd` hook system to check conditions before each prompt:

```zsh
# Function to show welcome once per day
show_daily_welcome() {
    local last_file=~/.welcome_last
    local today=$(date +"%Y-%m-%d")
    
    if [[ ! -f "$last_file" ]] || [[ $(cat "$last_file") != "$today" ]]; then
        ~/.local/bin/zsh_welcome.sh
        echo "$today" > "$last_file"
    fi
    
    # Remove the function after first execution to prevent multiple runs in same session
    unfunction show_daily_welcome
}

# Add to precmd hook
precmd_functions+=(show_daily_welcome)
```

### Benefits of MOTD Implementation

1. **Reduced Clutter**: Prevents the welcome message from appearing in every new terminal tab/session
2. **Better User Experience**: Provides a more traditional MOTD experience similar to system login messages
3. **Resource Efficiency**: Reduces unnecessary script executions
4. **Customizable Frequency**: Could be extended to other frequencies (weekly, monthly, etc.)

### Considerations

- Ensure proper file permissions for the timestamp file
- Handle edge cases like system date changes
- Consider making the frequency configurable (daily, weekly, etc.)