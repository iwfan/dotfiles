local builtin = require "telescope.builtin"

local M = {}

M.find = function()
    builtin.find_files {
        find_command = {
            "rg",
            "--hidden",
            "--no-ignore",
            "--follow",
            "--files",
            "--smart-case",
        },
    }
end

M.grep = function()
    builtin.live_grep()
    -- local search = vim.fn.input "Grep >"
    -- if search then
    --     builtin.grep_string { only_sort_text = true, search = search }
    -- else
    --     builtin.live_grep()
    -- end
end

return M
