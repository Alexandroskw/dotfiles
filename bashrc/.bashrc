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

# User specific aliases and functions
alias la="ls -labh"
alias nvidia="sudo nvidia-settings -a GPUFanControlState=1 -a GPUTargetFanSpeed=75"
alias ff="fastfetch"
alias flushdns="sudo systemd-resolve --flush-caches"
alias gitpop="git stash pop"

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

start_tmux(){
        if [ -z "$TMUX" ]; then
                tmux attach -t main || tmux new -As main
        fi
}

unset rc
. "$HOME/.cargo/env"

start_tmux
fastfetch

eval "$(starship init bash)"
