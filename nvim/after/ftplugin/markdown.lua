-- 为 Markdown 启用拼写检查和自动换行
vim.cmd "setlocal spell wrap"

-- 使用 Tree-sitter 进行折叠
vim.cmd "setlocal foldmethod=expr foldexpr=v:lua.vim.treesitter.foldexpr()"

-- 在 'mini.surround' 中设置 Markdown 特有的链接环绕
-- 用法: `saiwL` + 输入链接 + <CR> -> 添加链接 [word](link)
vim.b.minisurround_config = {
    custom_surroundings = {
        L = {
            input = { "%[().-()%]%(.-%)" },
            output = function()
                local link = require("mini.surround").user_input "Link: "
                if link == nil or link == "" then
                    return nil
                end
                return { left = "[", right = "](" .. link .. ")" }
            end,
        },
    },
}
