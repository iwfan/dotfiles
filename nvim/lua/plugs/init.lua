require 'plugs.web-icon'
require 'plugs.nvim-treesitter'
require 'zephyr'
require 'plugs.nvim-tree'
require 'colorizer'.setup({
    css = { rgb_fn = true; };
    scss = { rgb_fn = true; };
    sass = { rgb_fn = true; };
    stylus = { rgb_fn = true; };
    vim = { names = true; };
    tmux = { names = false; };
    'javascript';
    'javascriptreact';
    'typescript';
    'typescriptreact';
    html = {
      mode = 'foreground';
    }
})

require('indent_guides').options = {
    indent_guide_size = 1;
    exclude_filetypes = {'LuaTree','vista','help','sagahover'};
}

require 'plugs.galaxyline'
require 'plugs.bufferline'
require 'plugs.comment'
require 'plugs.signify'

