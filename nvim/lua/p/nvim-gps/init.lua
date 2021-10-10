local M = {}

M.setup = function()
    require("nvim-gps").setup {
        icons = {
            ["class-name"] = "ﴯ ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " ", -- Methods (functions inside class-like objects)
            ["container-name"] = " ", -- Containers (example: lua tables)
            ["tag-name"] = "炙", -- Tags (example: html tags)
        },
        separator = " > ",
    }
end

return M
