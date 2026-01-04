local M = {}

-- Open yazi file picker and return selected file to original tab
function M.yazi_picker()
    -- Create a temporary file to store the selected file path
    local temp_file = vim.fn.tempname()

    -- Save original tab and buffer
    local orig_tab = vim.api.nvim_get_current_tabpage()

    -- Get current file's directory
    local current_file = vim.api.nvim_buf_get_name(0)
    local start_dir

    if current_file ~= "" then
        -- If there's a current file, use its directory
        start_dir = vim.fn.fnamemodify(current_file, ":h")
    else
        -- If no file, use current working directory
        start_dir = vim.fn.getcwd()
    end

    -- Open new tab for yazi
    vim.cmd "tabnew"
    local yazi_tab = vim.api.nvim_get_current_tabpage()

    -- Run yazi with terminal command
    local cmd = string.format('yazi --chooser-file="%s" "%s"', temp_file, start_dir)
    vim.cmd("terminal " .. cmd)

    -- Get the terminal buffer and job id
    local term_buf = vim.api.nvim_get_current_buf()
    local term_job_id = vim.b[term_buf].terminal_job_id

    -- Enter insert mode for terminal
    vim.cmd "startinsert"

    -- Set up autocmd to handle when terminal closes
    local augroup = vim.api.nvim_create_augroup("YaziPicker", { clear = true })
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

                -- Close yazi tab
                pcall(function()
                    vim.api.nvim_set_current_tabpage(yazi_tab)
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

                -- Read the selected file path
                if vim.fn.filereadable(temp_file) == 1 then
                    local selected_file = vim.fn.readfile(temp_file)[1]

                    -- Clean up temp file
                    vim.fn.delete(temp_file)

                    -- Open the selected file in original tab
                    if selected_file and selected_file ~= "" then
                        vim.cmd("edit " .. vim.fn.fnameescape(selected_file))
                    end
                else
                    -- Clean up temp file if it exists
                    vim.fn.delete(temp_file)
                end

                -- Clear the autocmd group
                pcall(vim.api.nvim_del_augroup_by_name, "YaziPicker")
            end)
        end,
    })

    -- Enter insert mode
    vim.cmd "startinsert"
end

-- Setup function to create user command
function M.setup()
    -- Create Yazi file picker command
    vim.api.nvim_create_user_command("Yazi", function()
        M.yazi_picker()
    end, {
        desc = "Open Yazi file picker in new tab",
    })
end

return M
