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

# fzf
export FZF_DEFAULT_COMMAND="fd -H -I --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CUSTOM_COLORS="--color hl:#61AFEF,hl+:#56B6C2"
export FZF_DEFAULT_OPTS="$FZF_CUSTOM_COLORS --preview 'if [ -f {} ]; then bat --style=numbers --color=always --line-range :500 {}; elif [ -d {} ]; then ls -la {}; fi' --preview-window=right:50%:wrap --bind='ctrl-/:toggle-preview'"

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

typeset -aU path

export EDITOR="nvim"
export GIT_EDITOR="nvim"
