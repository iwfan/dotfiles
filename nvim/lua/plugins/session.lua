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
