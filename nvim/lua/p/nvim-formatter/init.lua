local prettier = {
    cmd = {
        function(file)
            return string.format("prettier -w %s", file)
        end,
    },
}

local filetype_format_conf = {
    html = { prettier },
    css = { prettier },
    less = { prettier },
    scss = { prettier },
    json = { prettier },
    jsonc = { prettier },
    xml = { prettier },
    yaml = { prettier },
    toml = { prettier },
    markdown = { prettier },
    graphql = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    lua = {
        {
            cmd = {
                function(file)
                    return string.format("stylua %s", file)
                end,
            },
        },
    },
}

require("format").setup(filetype_format_conf)

local extname_list = vim.tbl_keys(filetype_format_conf)
local filetype_list = vim.tbl_map(function(v)
    return "*." .. v
end, extname_list)

-- local filetypes = table.concat(filetype_list, ",")
-- augroup("FormatAutogroup", { { "BufWritePre", filetypes, "FormatWrite" } })
