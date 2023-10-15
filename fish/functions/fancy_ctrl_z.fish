function fancy_ctrl_z
  if test (jobs | count) -ne 0
    fg
    commandline -f repaint
  end
end
