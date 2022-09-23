#!/bin/bash
# Session Name
dir_name=${PWD##*/}          # to assign to a variable
git_branch=$(git branch --show-current)
session=$dir_name/$git_branch
SESSIONEXISTS=$(tmux list-sessions | grep $session)

# Only create tmux session if it doesn't already exist
if not [ "$SESSIONEXISTS" = "" ]
then
  # tmux kill-session -t $session
  tmux a -t $session
fi

# Start New Session with our name
tmux new-session -d -s $session
commandvenv="source venv/bin/activate"

window=1
tmux rename-window -t $session:$window 'neovim'
tmux send-keys -t $session:$window 't'
tmux send-keys -t $session:$window 'source' Space 'venv/bin/activate' C-m
tmux send-keys -t $session:$window 'nvim' C-m Enter C-m Enter C-m

window=2
tmux new-window -t $session:$window -n 'run python'
tmux send-keys -t $session:$window 't'
tmux send-keys -t $session:$window 'source' Space 'venv/bin/activate' C-m

window=3
tmux new-window -t $session:$window -n 'ranger'
tmux send-keys -t $session:$window 't'
tmux send-keys -t $session:$window 'ranger' Enter C-m
tmux send-keys -t $session:$window "'r" C-m


# Attach Session, on the Main window
tmux attach-session -t $session:1
