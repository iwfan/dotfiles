local M = {}

-- Open lazygit in a new tab
function M.lazygit()
    -- Save original tab
    local orig_tab = vim.api.nvim_get_current_tabpage()

    -- Get current file's directory or git root
    local current_file = vim.api.nvim_buf_get_name(0)
    local start_dir

    if current_file ~= "" then
        -- If there's a current file, use its directory
        start_dir = vim.fn.fnamemodify(current_file, ":h")
    else
        -- If no file, use current working directory
        start_dir = vim.fn.getcwd()
    end

    -- Open new tab for lazygit
    vim.cmd "tabnew"
    local lazygit_tab = vim.api.nvim_get_current_tabpage()

    -- Change to the start directory and run lazygit
    local cmd = string.format('cd "%s" && lazygit', start_dir)
    vim.cmd("terminal " .. cmd)

    -- Get the terminal buffer and job id
    local term_buf = vim.api.nvim_get_current_buf()
    local term_job_id = vim.b[term_buf].terminal_job_id

    -- Enter insert mode for terminal
    vim.cmd "startinsert"

    -- Set up autocmd to handle when terminal closes
    local augroup = vim.api.nvim_create_augroup("LazygitOpener", { clear = true })
    vim.api.nvim_create_autocmd("TermClose", {
        group = augroup,
        buffer = term_buf,
        callback = function()
            vim.schedule(function()
                -- Stop the job if it's still running
                if term_job_id then
                    pcall(vim.fn.jobstop, term_job_id)
                end

                -- Delete the terminal buffer
                if vim.api.nvim_buf_is_valid(term_buf) then
                    vim.api.nvim_buf_delete(term_buf, { force = true })
                end

                -- Close lazygit tab
                pcall(function()
                    vim.api.nvim_set_current_tabpage(lazygit_tab)
                    vim.cmd "tabclose!"
                end)

                -- Return to original tab
                local tab_valid = false
                for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
                    if tab == orig_tab then
                        tab_valid = true
                        break
                    end
                end

                if tab_valid then
                    vim.api.nvim_set_current_tabpage(orig_tab)
                end

                -- Refresh all buffers to show any git changes
                vim.cmd "checktime"

                -- Clear the autocmd group
                pcall(vim.api.nvim_del_augroup_by_name, "LazygitOpener")
            end)
        end,
    })
end

-- Setup function to create user command
function M.setup()
    -- Create Lazygit command
    vim.api.nvim_create_user_command("Lazygit", function()
        M.lazygit()
    end, {
        desc = "Open Lazygit in new tab",
    })
end

return M
