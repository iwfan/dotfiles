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
    require("resession").load(get_session_name(), { dir = "dirsession", silence_errors = true })
end, { force = true, nargs = 0 })

vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        require("resession").save(get_session_name(), { dir = "dirsession", notify = false })
    end,
})

return {
    {
        "stevearc/resession.nvim",
        opts = {},
    },
}
