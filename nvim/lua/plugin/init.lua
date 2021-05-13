local function packer_bootstrap()
  local install_path = stdpath .. '/site/pack/packer/opt/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  end

  cmd 'packadd packer.nvim'
  return require('packer')
end

local packer = packer_bootstrap()
local use = packer.use

packer.init({
  git = { clone_timeout = 120 },
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
})
packer.reset()
use {"wbthomason/packer.nvim", opt = true }

local appearance = require'plugin.appearance'
dump(appearance)

for _, plugin in ipairs(appearance)
do
  use(plugin)
end
