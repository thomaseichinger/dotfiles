#!/usr/bin/env zsh

SESSION=statst

tmux ls | grep $SESSION

[[ $? == "0" ]] && return

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Status window'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "systat -iostat 3" C-m
tmux select-pane -t 1
tmux send-keys "systat -vmstat 0.5" C-m
tmux split-window -v
tmux send-keys "systat -icmp 1" C-m
tmux select-pane -t 0
tmux split-window -v
tmux send-keys "systat -netstat 5" C-m
tmux split-window -v
tmux send-keys "systat -ifstat 0.5" C-m

tmux select-window -t $SESSION:1

