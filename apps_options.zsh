
##
# grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"