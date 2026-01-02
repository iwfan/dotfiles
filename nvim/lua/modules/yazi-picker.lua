local M = {}

-- Open yazi file picker and return selected file to original tab
function M.yazi_picker()
    -- Create a temporary file to store the selected file path
    local temp_file = vim.fn.tempname()

    -- Save original tab
    local orig_tab = vim.api.nvim_get_current_tabpage()

    -- Open new tab for yazi
    vim.cmd "tabnew"
    local yazi_tab = vim.api.nvim_get_current_tabpage()

    -- Run yazi with --chooser-file to output selected file
    local cmd = string.format('yazi --chooser-file="%s"', temp_file)

    vim.fn.termopen(cmd, {
        on_exit = function(_, exit_code)
            vim.schedule(function()
                -- Close yazi tab
                vim.api.nvim_set_current_tabpage(yazi_tab)
                vim.cmd "tabclose"

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
