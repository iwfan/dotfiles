return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.toggleterm"
        end,
    }
}
