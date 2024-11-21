#zmodload zsh/zprof
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::dnf
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# fzf
#export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f"

# Export Paths
export PATH="$PATH:/home/dazuki/.local/bin"
export PATH="$PATH:/home/dazuki/.cargo/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/home/dazuki/go/bin"
export PATH="$PATH:/home/dazuki/bin"
export PATH="$PATH:/home/dazuki/.viewaliases"
export PATH="$PATH:/home/dazuki/yt-scripts"
export PATH="$PATH:/home/dazuki/fastfetch/build"
export PATH="$PATH:/home/dazuki/wrun"

# Better docker ps
docker() {
  case $1 in
    ps)
      shift
      command dops "$@"
      ;;
    *)
      command docker "$@";;
  esac
}

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Remove double confirmation by zsh
setopt rm_star_silent

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':omz:plugins:nvm' lazy yes

# Alias
alias ssh="kitten ssh"
alias icat="kitten icat"
alias c="clear"
alias n="nvim"
alias ls="eza -hgo --no-filesize --group-directories-first --git-repos-no-status --icons=always --hyperlink"
alias web="cd /var/www/"
alias art="php artisan"
alias yt="ytfzf --show-thumbnails -T kitty"
alias rm-ffc="rm -rf ~/.cache/mozilla/firefox/*"
alias qbt-check="docker exec -it qbt-pro_vpn sh -c 'curl -s https://ipinfo.io/?token=$(skate get ipinfo)' | jq"
alias paperless-backup="docker exec -it paperless-webserver sh -c 'document_exporter /paperless_backup -z'"
alias viewalias="alias | viewaliases"
alias screen="TERM=screen screen"
alias pyactive="source ~/py_env/bin/activate"

# Oh-My-Posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/dazuki.toml)"

# Shell integrations
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
#zprof
