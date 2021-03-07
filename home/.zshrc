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

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

# Export variables
export ARCHFLAGS="-arch x86_64"
export EDITOR='kak'
PATH=$PATH:~/.local/bin

# prefix space for incognito
setopt HIST_IGNORE_SPACE

LS_COLORS='rs=0:di=01:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;35:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;32:*.jpeg=01;32:*.mjpg=01;32:*.mjpeg=01;32:*.gif=01;32:*.bmp=01;32:*.pbm=01;32:*.pgm=01;32:*.ppm=01;32:*.tga=01;32:*.xbm=01;32:*.xpm=01;32:*.tif=01;32:*.tiff=01;32:*.png=01;32:*.svg=01;32:*.svgz=01;32:*.mng=01;32:*.pcx=01;32:*.mov=01;32:*.mpg=01;32:*.mpeg=01;32:*.m2v=01;32:*.mkv=01;32:*.webm=01;32:*.webp=01;32:*.ogm=01;32:*.mp4=01;32:*.m4v=01;32:*.mp4v=01;32:*.vob=01;32:*.qt=01;32:*.nuv=01;32:*.wmv=01;32:*.asf=01;32:*.rm=01;32:*.rmvb=01;32:*.flc=01;32:*.avi=01;32:*.fli=01;32:*.flv=01;32:*.gl=01;32:*.dl=01;32:*.xcf=01;32:*.xwd=01;32:*.yuv=01;32:*.cgm=01;32:*.emf=01;32:*.ogv=01;32:*.ogx=01;32:*.aac=00;34:*.au=00;34:*.flac=00;34:*.m4a=00;34:*.mid=00;34:*.midi=00;34:*.mka=00;34:*.mp3=00;34:*.mpc=00;34:*.ogg=00;34:*.ra=00;34:*.wav=00;34:*.oga=00;34:*.opus=00;34:*.spx=00;34:*.xspf=00;34:'

export LS_COLORS

## User aliases ##
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
alias "feh"="feh -Zx."
alias "imv"="imv -u nearest_neighbour"

# compression commands
alias "unzip"="aunpack"
alias "zip"="apack"

# when compiling latex, just exit when failing
alias "pdflatex"="pdflatex -halt-on-error"
