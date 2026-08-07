export CLICOLOR=1

# Prevent problems with $PATH prepend if double-sourced
typeset -U path

# ---------------------------------------
# Toolchain environment
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init - zsh)"
fi

# ---------------------------------------
# Support cli editing via ctrl+x+e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# ---------------------------------------
# Enable autocompletion
autoload -Uz compinit
compinit

# ---------------------------------------
# Autocomplete directories in ~/src
s() {
  builtin cd -- "$HOME/src/${1:?directory name required}"
}

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

_s() {
  _files -W "$HOME/src" -/
}

compdef _s s

# ---------------------------------------
# Git info in shell prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f '
setopt prompt_subst
PROMPT='%F{green}%n@%m%f ${vcs_info_msg_0_}%F{blue}%~%f %F{cyan}$%f '

# ---------------------------------------
# Add installed user scripts to $PATH
path=("$HOME/.bin" $path)

# ---------------------------------------
# Aliases
alias ls='ls -G'
alias ga="git add"
alias gs="git status"
alias gd="git diff"
alias tf="terraform"
alias tempe='cd "$(mktemp -d)"'
alias wx='curl "https://wttr.in/Fort%20Collins?u0"'
alias serveit='python3 -m http.server 8000'
alias dc="docker compose"
alias dcb="docker compose build"
alias dcd="docker compose down"
alias dce="docker compose exec"
alias dcu="docker compose up"
alias vi="nvim"
alias vim="nvim"

# ---------------------------------------
# Colorize man page output
export MANPAGER="less -R --use-color -Dd+r -Du+b"

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY



# ---------------------------------------
# Generate secure passwords
genpass() {
  local length=${1:-20}
  LC_ALL=C tr -dc "23456789abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ" < /dev/urandom | head -c $length ; echo
}
