# tput interactive fix
[[ ! -o interactive ]] && return

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Export Paths
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:${HOME}/bin"
export PATH="$PATH:${HOME}/go/bin"
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/.cargo/bin"

# composer bin
export PATH="$PATH:${HOME}/.config/composer/vendor/bin"

# vopono
export PATH="$PATH:${HOME}/vopono"

# fzf
export FZF_DEFAULT_COMMAND="fd -H --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CUSTOM_COLORS="--color=fg:#abb2bf,bg:-1,hl:#61afef,fg+:#abb2bf,bg+:#3e4452,hl+:#e06c75,info:#e5c07b,prompt:#98c379,pointer:#61afef,marker:#98c379,spinner:#61afef,header:#61afef"
export FZF_DEFAULT_OPTS="$FZF_CUSTOM_COLORS --style minimal --preview 'if [ -f {} ]; then bat --style=numbers --color=always --line-range :500 {}; elif [ -d {} ]; then eza -la --group-directories-first --icons=always --no-git --no-permissions --no-filesize --no-user --no-time {}; fi' --preview-window=right:50%:wrap --bind='ctrl-/:toggle-preview'"

# add color to man pages
export MANROFFOPT="-c"
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)

# google gemini api
export GEMINI_API_KEY=$(skate get gemini_api_key)

# mcp
export CONTEXT7_API_KEY=$(skate get context7_api_key)
export EXA_API_KEY=$(skate get exa_api_key)

typeset -aU path

export SUDO_EDITOR=$(which nvim)
export VISUAL="nvim"
export EDITOR="nvim"
export GIT_EDITOR="nvim"

. "$HOME/.cargo/env"
