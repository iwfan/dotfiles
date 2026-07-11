-- ============================================================================
-- fff.nvim — fuzzy file finder with Rust backend
-- ============================================================================

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "fff.nvim" and (kind == "install" or kind == "update") then
            if not ev.data.active then
                vim.cmd.packadd "fff.nvim"
            end
            require("fff.download").download_or_build_binary()
        end
    end,
})

vim.g.fff = {
    lazy_sync = true,
    debug = { enabled = true, show_scores = true },
}

require("fff").setup {
    prompt = "> ",
    title = "File Search",
    layout = {
        height = 0.9,
        width = 0.0,
        prompt_position = "top",
        preview_position = "right",
        preview_size = 0.6,
    },
    preview = {
        line_numbers = true,
        cursorlineopt = "both",
    },
}

vim.keymap.set("n", "<C-p>", function()
    require("fff").find_files()
end)

vim.keymap.set("n", "<C-f>", function()
    require("fff").live_grep_under_cursor()
end)
