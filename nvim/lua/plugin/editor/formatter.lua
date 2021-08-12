local prettier = function()
    return {
        exe = "prettier",
        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
        stdin = true
    }
end

require('formatter').setup({
    logging = false,
    filetype = {
        html = {prettier},
        css = {prettier},
        less = {prettier},
        scss = {prettier},
        json = {prettier},
        xml = {prettier},
        yaml = {prettier},
        javascript = {prettier},
        typescript = {prettier},
        javascriptreact = {prettier},
        typescriptreact = {prettier},
        lua = {
            -- luafmt
            function() return {exe = "lua-format", stdin = true} end
        }
    }
})

augroup('FormatAutogroup', {{'BufWritePost', '*', 'FormatWrite'}})
