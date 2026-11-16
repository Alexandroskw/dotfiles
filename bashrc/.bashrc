# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
HISTCONTROL=ignoreboth:ignoredups:erasedups

# User specific aliases and functions
alias ls="ls -l --color=always"
alias la="ls -la --color=always"
alias ff="fastfetch"
alias flush-dns="sudo systemd-resolve --flush-caches"
alias pop="git stash pop"
alias drop="git stash drop"
alias status="git status"
alias diff="git diff"
alias cat="bat --color=always"
alias vim="nvim"
alias cls="clear && ff"
alias rup="rustup update"
alias rf="rm -rf"
alias ifconfig="ip addr show"
alias apagar="shutdown now"
alias reset-plasma="kquitapp6 plasmashell; kstart plasmashell"
alias ll="ollama"
alias list="ollama list"

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

start_tmux(){
    if [ -z "$TMUX" ]; then
        tmux attach -t main || tmux new -A -s main
    fi
}

unset rc
. "$HOME/.cargo/env"

start_tmux
fastfetch

eval "$(thefuck --alias)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
