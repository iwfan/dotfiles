local appearance = {}
local insert = _G.insert(appearance)

insert {
  "glepnir/dashboard-nvim",
  --config = appearance.dashboard
}

insert {
  "kyazdani42/nvim-tree.lua",
  --config = appearance.nvim_tree,
  requires = "kyazdani42/nvim-web-devicons"
}

insert {
  "glepnir/galaxyline.nvim",
  branch = "main",
  config = function()
    require "plugs.galaxyline"
  end,
  requires = {
    "glepnir/zephyr-nvim",
    "kyazdani42/nvim-web-devicons"
  }
}

insert {
  "Akin909/nvim-bufferline.lua",
  --config = appearance.bufferline,
  requires = "moll/vim-bbye"
}

return appearance
