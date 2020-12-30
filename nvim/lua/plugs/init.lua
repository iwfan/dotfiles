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

require'terminal'.setup()

require('indent_guides').setup{
    indent_guide_size = 1;
    indent_start_level = 2;
    exclude_filetypes = {'LuaTree', 'startify', 'vista','help','sagahover'};
}

require 'plugs.galaxyline'
require 'plugs.bufferline'
require 'plugs.signify'
-- require 'plugs.lsp'
require 'plugs.searching'
require 'plugs.misc-settings'
