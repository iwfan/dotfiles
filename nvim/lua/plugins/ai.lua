return {
    {
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = function()
            -- conditionally use the correct build system for the current OS
            if vim.fn.has "win32" == 1 then
                return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            else
                return "make"
            end
        end,
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            -- add any opts here
            -- for example
            provider = "moonshot",
            providers = {
                moonshot = {
                    __inherited_from = "openai",
                    endpoint = "https://api.moonshot.cn/v1",
                    api_key_name = "ANTHROPIC_AUTH_TOKEN",
                    model = "kimi-k2-0711-preview",
                    timeout = 30000, -- Timeout in milliseconds
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 32768,
                    },
                },
                openrouter = {
                    __inherited_from = "openai",
                    endpoint = "https://openrouter.ai/api/v1",
                    api_key_name = "OPENROUTER_API_KEY",
                    model = "anthropic/claude-sonnet-4",
                    timeout = 30000, -- Timeout in milliseconds
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 20480,
                    }
                },
            },
            behaviour = {
                enable_fastapply = true, -- Enable Fast Apply feature
            },
            windows = {
                input = {
                    prefix = "> ",
                    height = 15, -- Height of the input window in vertical layout
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
}
