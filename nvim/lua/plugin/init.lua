local install_path = stdpath .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  exec 'packadd packer.nvim'
end

--for _, def in ipairs(definition)
--do
--  local event, filetype, command = unpack(def)
--  autocmd(event, filetype, command)
--end
