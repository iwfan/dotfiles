-- @see https://gist.github.com/galaxia4Eva/9e91c4f275554b4bd844b6feece16b3d
-- @see https://github.com/kovidgoyal/kitty/issues/719#issuecomment-952039731
return function(INPUT_LINE_NUMBER, CURSOR_LINE, CURSOR_COLUMN)
    local term_buf = vim.api.nvim_create_buf(true, false)
    local term_io = vim.api.nvim_open_term(term_buf, {})
    vim.api.nvim_buf_set_keymap(term_buf, "n", "q", "<Cmd>q<CR>", {})
    local group = vim.api.nvim_create_augroup("kitty+page", {})

    vim.api.nvim_create_autocmd("ModeChanged", {
        group = group,
        buffer = term_buf,
        command = "stopinsert",
    })

    vim.api.nvim_create_autocmd("VimEnter", {
        group = group,
        pattern = "*",
        once = true,
        callback = function(ev)
            local current_win = vim.fn.win_getid()
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)) do
                vim.api.nvim_chan_send(term_io, line)
                vim.api.nvim_chan_send(term_io, "\r\n")
            end
            print("kitty sent:", INPUT_LINE_NUMBER, CURSOR_LINE, CURSOR_COLUMN)
            term_io = false
            vim.api.nvim_win_set_buf(current_win, term_buf)
            vim.api.nvim_buf_delete(ev.buf, { force = true })
            local line_count = vim.api.nvim_buf_line_count(0)
            vim.api.nvim_win_set_cursor(current_win, { line_count, 0 })
        end,
    })
end
