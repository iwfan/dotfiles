function attach_tmux -d "attach tmux session"
  tmux attach -t f || tmux new -s f
end
