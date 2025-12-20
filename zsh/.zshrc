#zmodload zsh/zprof

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
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux

# custom completions
fpath=(~/.zsh/completions $fpath)

# load completions
autoload -Uz compinit
compinit

zinit cdreplay -q

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# setopts
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion styling
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -1 --color=always $realpath'

# zsh functions & aliases
source "${HOME}/.zsh_functions"
source "${HOME}/.zsh_aliases"

# evals
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/dazuki.toml)"
eval "$(zoxide init zsh)"

# FZF
source <(fzf --zsh)

# fnm
FNM_PATH="/home/dazuki/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/dazuki/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

#zprof
