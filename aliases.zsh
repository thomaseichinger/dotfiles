alias networkwho='sudo lsof -i -P | egrep -i "listen|established"'
alias ip_please='echo -n "local: " && ifconfig | grep -i "inet " | cut -d " " -f 2 | tail -n 1 && echo -n "extern: " && curl http://www.icanhazip.com'
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias unload_ftdi='sudo kextunload -b com.apple.driver.AppleUSBFTDI'
alias load_ftdi='sudo kextload -b com.apple.driver.AppleUSBFTDI'
alias devdevs='ls /dev/tty.*'
alias pyterm='python2.7 ~/code/RIOT/RIOT/dist/tools/pyterm/pyterm.py $PORT'
alias g='git'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi
# List direcory contents
alias ls='ls $colorflag'
alias lsa='ls -lah $colorflag'
alias l='ls -la $colorflag'
alias ll='ls -l $colorflag'
alias la='ls -lA $colorflag'

# Basic directory operations
alias ...='cd ../..'
alias ..='cd ..'
alias md='mkdir -p'

# file operations
alias cp='cp -iv'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'

# git shortcuts
alias gst='git status'
alias gdi='git diff'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# OS X has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# OS X has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# misc.
alias now='date'

# freeBSD specifics
if [[ `uname` == "FreeBSD" ]]; then
  alias setup_tmux='source ~/dotfiles/tmux/setup_stats_session.zsh'
  alias stats='setup_tmux; tmux attach -t stats'
fi

