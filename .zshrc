# download zinit if it doesn't exist
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::dnf
zinit snippet OMZP::command-not-found

# load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# setopts
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':omz:plugins:nvm' lazy yes

# zsh functions & aliases
source "${HOME}/.zsh_functions"
source "${HOME}/.zsh_aliases"

# evals
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/dazuki.toml)"
eval "$(zoxide init zsh)"

# libvirt
export LIBVIRT_DEFAULT_URI="qemu:///system"

# FZF
source <(fzf --zsh)
export PATH="/home/dazuki/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/dazuki/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
