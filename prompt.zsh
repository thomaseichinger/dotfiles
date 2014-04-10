
autoload -U promptinit
promptinit
setopt PROMPT_SUBST

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '*'
zstyle ':vcs_info:git:*' unstagedstr '%F{red}!!%f'
zstyle ':vcs_info:git:*' actionformats '[%b|%a] '
zstyle ':vcs_info:git:*' formats '[%F{green}%b%f%c%u] '
zstyle ':vcs_info:git:*' branchformat '%b:%r'

precmd () { vcs_info }

if [[ "$TERM" != "dumb" ]]; then
    export PROMPT='%B%(?..[%?] )%b%F{green}%3~%f@%F{magenta}%m%f ${vcs_info_msg_0_}%# '
    #export RPROMPT="%F{green%~%f"
else
    export PROMPT="%(?..[%?] )%n@%m:%~> "
fi

prompt_opts=(cr percent)