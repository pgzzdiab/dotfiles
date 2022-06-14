#!/bin/bash
# Session Name
session=$(git branch --show-current)
SESSIONEXISTS=$(tmux list-sessions | grep $session)

# Only create tmux session if it doesn't already exist
if not [ "$SESSIONEXISTS" = "" ]
then
  # tmux kill-session -t $session
  tmux a -t $session
fi

# Start New Session with our name
tmux new-session -d -s $session

tmux rename-window -t $session:1 -n 'neovim'
tmux send-keys -t 'neovim' C-m '. venv/bin/activate' C-m
tmux send-keys -t 'neovim' C-m 'v' C-m

# Create and setup pane
tmux new-window -t $session:2 -n 'python'
# tmux rename-window -t $session:1 -n 'python'
tmux send-keys -t 'python' C-m '. venv/bin/activate' C-m

# Setup an additional shell
tmux new-window -t $session:3 -n 'ranger'
tmux send-keys -t 'ranger' C-m "ranger" C-m


# Attach Session, on the Main window
tmux attach-session -t $session:1
