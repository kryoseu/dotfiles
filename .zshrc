# ========================
# Hyde Configuration
# ========================

# 1. ~/.hyde.zshrc - Customizes shell-related Hyde configurations.
# 2. ~/.zshenv - Updates Zsh environment variables handled by Hyde (modified across updates).

# ========================
# Plugin Management
# ========================

# Oh-My-Zsh plugins are loaded in ~/.hyde.zshrc file.

# ========================
# Environment Variables
# ========================

# ------------------------
# Talos Configuration
# ------------------------
export TALOSCONFIG="/home/${USER}/Kubernetes/Talos/Configs/talosconfig"

# ------------------------
# FZF Configuration
# ------------------------
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_TMUX_OPTS=" -p90%,70% "  # Default for tmux
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# ------------------------
# Yazi Configuration
# ------------------------
export EDITOR=code  # Default editor

# ========================
# Aliases
# ========================

# ------------------------
# Directory Listing (eza)
# ------------------------
if [[ -x "$(which eza)" ]]; then
    alias ls='eza'
    alias l='eza -lh --icons=auto'
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first'
    alias ld='eza -lhD --icons=auto'
    alias lt='eza --icons=auto --tree'
    alias llt='eza -lah --icons=auto --tree'
fi

# ------------------------
# System Utilities
# ------------------------
alias c='clear'
alias un='$aurhelper -Rns'  # Uninstall packages
alias up='$aurhelper -Syu'  # Update system
alias pl='$aurhelper -Qs'   # List installed packages
alias pa='$aurhelper -Ss'   # Search for packages
alias pc='$aurhelper -Sc'   # Clean package cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'  # Remove orphaned packages
alias vc='code'  # VSCode

# ------------------------
# Navigation
# ------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias mkdir='mkdir -p'

# ------------------------
# Package Management (pacman)
# ------------------------
alias pac='sudo pacman -S'  # Install packages
alias fman='compgen -c | fzf | xargs man'  # Fuzzy find man pages