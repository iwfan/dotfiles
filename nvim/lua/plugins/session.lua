local function get_session_name()
    local name = vim.fn.getcwd()
    local branch = vim.fn.system "git branch --show-current"
    if vim.v.shell_error == 0 then
        return name .. branch
    else
        return name
    end
end

vim.api.nvim_create_user_command("ReadSession", function()
    require("persistence").load()
end, { force = true, nargs = 0 })

return {
    {
        "folke/persistence.nvim",
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
    },
}
