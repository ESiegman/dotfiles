return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach", -- Load Lspsaga when LSP attaches to a buffer
    config = function()
        require("lspsaga").setup({
            -- Configuration for the Lspsaga UI
            ui = {
                theme = 'round', -- Rounded window borders
                border = 'single', -- Border style: single, double, rounded, etc.
                winblend = 10, -- Transparency for floating windows
                expand = "", -- Collapsed sign for code folding
                collapse = "", -- Expanded sign for code folding
            },

            -- Code Action Lightbulb
            code_action_lightbulb = {
                enable = true,
                sign = true,
                enable_in_insert = false, -- Disable in insert mode
                sign_priority = 20,   -- Priority for the lightbulb sign
                virtual_text = true,  -- Show virtual text indicator
            },

            -- Symbol in winbar
            symbol_in_winbar = {
                enable = true,
                separator = '  ',
                ignore_patterns = {}, -- Files to ignore for the symbol
            },

            -- UI Configuration for Finder (LSP finder window)
            finder = {
                max_height = 0.5, -- Maximum height of the finder window
                min_width = 30, -- Minimum width of the finder window
                force_max_height = false,
                keys = {
                    jump_to = 'p',   -- Key to jump to the result
                    expand_or_jump = 'o', -- Expand or jump to result
                    vsplit = 's',    -- Open in vertical split
                    split = 'i',     -- Open in horizontal split
                    tabe = 't',      -- Open in new tab
                    quit = 'q',      -- Quit the finder
                },
            },

            -- Diagnostic UI
            diagnostic = {
                on_insert = false,
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                max_width = 0.8,
                max_height = 0.6,
                diagnostic_header = { " ", " ", " ", " " },
                show_close_icon = true,
                keys = {
                    exec_action = "o",
                    quit = "q",
                    go_action = "g"
                },
            },

            -- Code action UI
            code_action = {
                num_shortcut = true,
                show_server_name = true,
                extend_gitsigns = false,
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },

            -- Hover UI
            hover = {
                max_width = 0.6,
                open_link = 'gx',      -- Key to open link in hover window
                open_browser = '!firefox', -- Command to open browser
            },
        })
    end,
}
