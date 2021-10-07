local enhance_attach = require "p.nvim-lsp.enhance_attach"

return function(default_opt)
    default_opt.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false

        local ts_utils = require "nvim-lsp-ts-utils"
        -- defaults
        ts_utils.setup {
            debug = false,
            disable_commands = false,
            enable_import_on_completion = true,
            -- import all
            import_all_timeout = 5000, -- ms
            import_all_priorities = {
                buffers = 4, -- loaded buffer names
                buffer_content = 3, -- loaded buffer content
                local_files = 2, -- git files or files with relative path markers
                same_file = 1, -- add to existing import statement
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- eslint
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_enable_diagnostics = false,
            eslint_bin = "eslint_d",
            eslint_opts = {
                "-f",
                "json",
                "--stdin",
                "--stdin-filename",
                "$FILENAME",
            },

            -- formatting
            enable_formatting = false,
            formatter = "prettier",
            formatter_opts = { "--stdin-filepath", "$FILENAME" },

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
        }

        -- required to enable ESLint code actions and formatting
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true })

        enhance_attach(client, bufnr)
    end

    return default_opt
end
