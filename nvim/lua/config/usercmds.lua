vim.api.nvim_create_user_command(
    "FN",
    "let @*=join([expand('%'), line('.'), col('.')], ':')",
    { force = true, nargs = 0 }
)
vim.api.nvim_create_user_command(
    "AFN",
    "let @*=join([expand('%:p'), line('.'), col('.')], ':')",
    { force = true, nargs = 0 }
)

vim.api.nvim_create_user_command("H", function(args)
    vim.cmd("vert h " .. args.args)
end, { nargs = 1, complete = "help" })

vim.api.nvim_create_user_command("Format", function()
    require("conform").format { lsp_format = true }
end, { nargs = 0 })


-- Copied from: https://github.com/Sin-cy/nvim-nightly/blob/main/lua/sethy/commands.lua

-- Custom packer commands
-- NOTE: pack add
vim.api.nvim_create_user_command("PackAdd", function(opts)
    vim.pack.add(opts.fargs)
end, { nargs = "+", desc = "Add plugins (PackAdd user/repo)", })

--:packupdate :packupdate! :packdel :packdel! now supported in 0.13 nightly as of May 17
-- NOTE: pack delete
vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDel plugin1 plugin2)", })

-- NOTE: pack update
vim.api.nvim_create_user_command("PackUpdate", function(opts)
    if opts.args ~= "" then
        -- update specific plugins
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
        vim.pack.update(plugins)
    else
        -- update all
        vim.pack.update()
    end
end, { desc = "Update all plugins or specific ones", nargs = "*", })


-- NOTE: pack nonactive - show all non active plugins on disk but removed from pack.lua
vim.api.nvim_create_user_command("PackCheck", function()
    local non_active = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #non_active == 0 then
        vim.notify("🆗 No non-active plugins found!", vim.log.levels.INFO)
        return
    end

    vim.print("😴 Non-active plugins :")
    print(" ")
    for _, name in ipairs(non_active) do
        print(name)
    end

    print(" ")

    local choice = vim.fn.confirm(
        "Delete ALL non-active plugins from disk?",
        "&Yes\n&No",
        2  -- default = No
    )

    if choice == 1 then
        vim.pack.del(non_active)
        vim.notify("🗑️  Deleted " .. #non_active .. " non-active plugin(s)", vim.log.levels.INFO)
        print("Non-active plugins deleted!")
        vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
    else
        vim.notify("Cancelled. No plugins were deleted!", vim.log.levels.INFO)
    end
end, { desc = "List non active plugins and select to delete"})
