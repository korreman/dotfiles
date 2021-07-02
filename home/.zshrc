# Path to your oh-my-zsh installation.
export ZSH="/home/korreman/.oh-my-zsh"

ZSH_THEME="korreman"

# Hyphen-insensitive completion. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Timestamp format for history command
HIST_STAMPS="yyyy-mm-dd"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

### User configuration ###
# ssh-agent
# this enables remembering signed ssh-keys (so you don't have to type your
# git password for every push)
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > ~/.ssh-agent-pid
fi

# nnn config
# below config makes nnn cd on quit
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -oe "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

# Export variables
export ARCHFLAGS="-arch x86_64"
export EDITOR='kak'
export VISUAL='kak'
PATH=$PATH:~/.local/bin

# prefix space for incognito
setopt HIST_IGNORE_SPACE

## User aliases ##
function k() {
    if [ ${#} = '0' ]; then
        kak $(mktemp);
    else
        kak $*;
    fi
}

# Using local programming language environments
alias "ghci"="stack ghci"
alias "ghc"="stack ghc -- -W"

# Mount aliases
alias "mount"="udevil mount"
alias "umount"="udevil umount"

# Replace regular `top` with `htop`
alias "top"="htop"

# calendar alias
alias "cal"="cal -wym"

# settings for feh
alias "feh"="feh -Z."
alias "imv"="imv -u nearest_neighbour"

# compression commands
alias "unzip"="aunpack"
alias "zip"="apack"

# when compiling latex, just exit when failing
alias "pdflatex"="pdflatex -halt-on-error"

# auto hardware decoding for mpv
alias "mpv"="mpv --hwdec=auto"
