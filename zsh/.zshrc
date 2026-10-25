alias ask='gemini'

# Enable Zsh Prompt Parameter Substitution & Hooks
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit

# Load Standalone CachyOS Plugins (Autosuggestions & Syntax Highlighting)
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Cyberdeck Starship Configuration
export STARSHIP_CONFIG="$HOME/dotfiles/starship/.config/starship/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
