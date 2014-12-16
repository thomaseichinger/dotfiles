local ZROOT=$HOME/dotfiles

ZDOTDIR=${ZDOTDIR:-${HOME}/.zsh}
#ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR}/.zsh_history"
HISTSIZE='10000'
SAVEHIST="${HISTSIZE}"
export TMP="$HOME/.tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"

[[ ! -d "${TMP}" ]] && mkdir "${TMP}"

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
setopt noflowcontrol

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Completion.
fpath=($ZROOT/completion $fpath)

##
# Load basic functions
if [[ -e $ZROOT/basics.zsh ]]; then
    source $ZROOT/basics.zsh
else
    echo "*E* ./basics.zsh not found."
fi

##
# Load aliases
try_source $ZROOT/aliases.zsh "*E*"

##
# Load functions
try_source $ZROOT/functions.zsh "*E*"

##
# Load RIOT base command
try_source $ZROOT/riot_base.zsh

##
# Load App options
try_source $ZROOT/apps_options.zsh

##
# Load PROMPT definition
try_source $ZROOT/prompt.zsh

export EDITOR="atom -w"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
