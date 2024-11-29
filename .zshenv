ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
. "$HOME/.cargo/env"

# charm POP
source "${HOME}/.zsh_pop"

# virt-manager stuff
export LIBVIRT_DEFAULT_URI="qemu:///system"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# Export Paths
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:${HOME}/bin"
export PATH="$PATH:${HOME}/go/bin"
export PATH="$PATH:${HOME}/.local/bin"
export PATH="$PATH:${HOME}/.cargo/bin"
export PATH="$PATH:${HOME}/.viewaliases"
export PATH="$PATH:${HOME}/yt-scripts"
export PATH="$PATH:${HOME}/fastfetch/build"
export PATH="$PATH:${HOME}/wrun"
export PATH="$PATH:${HOME}/vdf_to_json"

# fzf
export FZF_DEFAULT_COMMAND="fd -u --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--color bg:-1,bg+:-1,fg:-1,fg+:#feffff,hl:#993f84,hl+:#d256b5,info:#676767,prompt:#676767,pointer:#676767"

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
