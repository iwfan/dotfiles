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
local editor = require'plugin.editor'
local languages = require'plugin.languages'
local tools = require'plugin.tools'
local version_control = require'plugin.version_control'

local plugins = list_merge(appearance, editor, languages, tools, version_control)
for _, plugin in ipairs(plugins)
do
  use(plugin)
end

map_cmd("n|<F3>", "PackerCompile", { silent = false })
map_cmd("n|<F4>", "PackerSync", { silent = false })
