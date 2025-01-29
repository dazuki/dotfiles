xrandr --output DVI-D-1 --primary --mode 1920x1080_120.00 --pos 0x0 --rotate normal

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
