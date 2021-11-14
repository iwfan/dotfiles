require("bufferline").setup {
    options = {
        modified_icon = font_icon.edit,
        close_icon = font_icon.close,
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_tab_indicators = true,
        diagnostics = false,
        custom_filter = function(buf_number)
            -- Func to filter out our managed/persistent split terms
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)
            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end,
    },
}

map_cmd("n|<M-{>", "BufferLineCyclePrev")
map_cmd("n|<M-}>", "BufferLineCycleNext")
map_cmd("n|C<Tab>", "BufferLinePick")
map_cmd("n|<M-w>", "Bdelete!")

map_cmd("n|[b", "BufferLineCyclePrev")
map_cmd("n|]b", "BufferLineCycleNext")
map_cmd("n|[B", "BufferLineMovePrev")
map_cmd("n|]B", "BufferLineMoveNext")
map_cmd("n|<leader>b", "BufferLinePick")
map_cmd("n|<bs>b", "Bdelete!")
