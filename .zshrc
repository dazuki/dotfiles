# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Export Paths
export PATH="$PATH:/home/dazuki/.local/bin"
export PATH="$PATH:/home/dazuki/.cargo/bin"
export PATH="$PATH:/home/dazuki/Qt/6.7.2/gcc_64/bin"
export PATH="$PATH:/home/dazuki/quickemu"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/home/dazuki/go/bin"
export PATH="$PATH:/home/dazuki/ZDL/ZDL_3-1.1_Linux_x64"
export PATH="$PATH:/home/dazuki/bin"
export PATH="$PATH:/home/dazuki/.viewaliases"

#export PATH="$PATH:/home/dazuki/graalvm-jdk-17.0.12+8.1/bin"
#export JAVA_HOME="/home/dazuki/graalvm-jdk-17.0.12+8.1"

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

# Alias
alias ssh="kitten ssh"
alias icat="kitten icat"
alias c="clear"
alias n="nvim"
alias ls="eza -hgo --no-filesize --group-directories-first --git-repos-no-status --icons=always --hyperlink"
alias web="cd /var/www/"
alias pping="prettyping --nolegend"
alias art="php artisan"
alias arthost="php artisan serve --host=192.168.0.159 --port=8001"
alias yt="ytfzf --show-thumbnails -T kitty"
alias rm-ffc="rm -rf ~/.cache/mozilla/firefox/*"
alias qbt-check="docker exec -it qbt-pro_vpn sh -c 'curl -s https://ipinfo.io/?token=$(skate get ipinfo)' | jq"
alias viewalias="alias | viewaliases"

# rclone alias
alias mnt-android="rclone mount android:/data/data/com.termux/files/home/ /data/mnt-android"
alias mnt-bgse="rclone mount bgse-server:/home/dazuki/ /data/mnt-bgse"
alias mnt-dropbox="rclone mount dropbox:/ /data/mnt-dropbox"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(gh copilot alias -- zsh)"
