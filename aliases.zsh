alias networkwho='sudo lsof -i -P | egrep -i "listen|established"'
alias ip_please='echo -n "local: " && ifconfig | grep -i "inet " | cut -d " " -f 2 | tail -n 1 && echo -n "extern: " && curl http://www.icanhazip.com'
alias showHiddenFiles='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias hideHiddenFiles='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias unload_ftdi='sudo kextunload -b com.apple.driver.AppleUSBFTDI'
alias load_ftdi='sudo kextload -b com.apple.driver.AppleUSBFTDI'
alias devdevs='ls /dev/tty.*'
alias pyterm='python2.7 ~/code/RIOT/RIOT/dist/tools/pyterm/pyterm.py $PORT'

# List direcory contents
alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'

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

# misc.
alias now='date'