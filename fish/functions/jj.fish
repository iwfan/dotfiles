function jj -d "jump to anywhere"
  cd (z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q $_last_z_args)
end
