# ============================================================
# Zsh
# ============================================================


# ------------------------------------------------------------
# History
# ------------------------------------------------------------

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space


# ------------------------------------------------------------
# Completion
# ------------------------------------------------------------

autoload -Uz compinit
compinit

# ------------------------------------------------------------
# Jump
# ------------------------------------------------------------

source "$HOME/.config/zsh/jump.zsh"


# ------------------------------------------------------------
# Line editor
# ------------------------------------------------------------

# Emacs-style shell editing.
bindkey -e

# Option + Left / Right
bindkey '^[b' backward-word
bindkey '^[f' forward-word


# ------------------------------------------------------------
# fzf
# ------------------------------------------------------------

source <(fzf --zsh)


# ------------------------------------------------------------
# zoxide
# ------------------------------------------------------------

eval "$(zoxide init zsh)"


# ------------------------------------------------------------
# eza
# ------------------------------------------------------------

export EZA_CONFIG_DIR="$HOME/.config/eza"

alias l='eza'
alias ll='eza -lah'
alias la='eza -la'
alias lt='eza --tree --level=2'


# ------------------------------------------------------------
# Native macOS ls
# ------------------------------------------------------------

# Keep BSD ls available as `ls`, but colorize it.
export CLICOLOR=1
export LSCOLORS="exGxcxdxbxegedabagacad"


# ------------------------------------------------------------
# Starship themes
# ------------------------------------------------------------

starship-theme() {
  local theme="$1"
  local base="$HOME/dotfiles/starship/.config/starship/themes"

  if [[ -z "$theme" ]]; then
    echo "current:"
    if [[ -n "$STARSHIP_CONFIG" ]]; then
      basename "$STARSHIP_CONFIG" .toml
    else
      echo "default"
    fi

    echo
    echo "available:"
    echo "default"

    if [[ -d "$base" ]]; then
      command ls "$base" | sed 's/\.toml$//'
    fi

    return
  fi

  if [[ "$theme" == "default" ]]; then
    unset STARSHIP_CONFIG
    return
  fi

  local file="$base/$theme.toml"

  if [[ ! -f "$file" ]]; then
    echo "unknown theme: $theme"
    echo
    echo "available:"
    echo "default"
    command ls "$base" | sed 's/\.toml$//'
    return 1
  fi

  export STARSHIP_CONFIG="$file"
}


# ------------------------------------------------------------
# Starship
# ------------------------------------------------------------

eval "$(starship init zsh)"


# ------------------------------------------------------------
# Autosuggestions
# ------------------------------------------------------------

source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"


# ------------------------------------------------------------
# Syntax highlighting
#
# Keep this last. It needs to see the widgets/plugins that
# were registered earlier in the file.
# ------------------------------------------------------------

source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
