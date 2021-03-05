# Completion Settings -------------------------

# Enable completion
autoload -Uz compinit && compinit

# Display all completion candidates
setopt AUTO_LIST

# Automatically add a trailing slash to a completed directory name
setopt AUTO_PARAM_SLASH

# Regard aliases as distinct commands for completion purposes
setopt COMPLETE_ALIASES
