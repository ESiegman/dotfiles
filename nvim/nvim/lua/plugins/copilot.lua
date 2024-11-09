return {
    -- Copilot Lua plugin
    "zbirenbaum/copilot.lua",
    dependencies = {
        "zbirenbaum/copilot-cmp", -- Copilot integration with nvim-cmp
    },
    config = function()
        -- Configure Copilot itself
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>"
                },
                layout = {
                    position = "bottom", -- Position of the Copilot panel
                    ratio = 0.4     -- Ratio of the screen the panel takes
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = "<M-l>", -- Accept the suggestion with Alt+L
                    next = "<M-]>", -- Navigate to the next suggestion
                    prev = "<M-[>", -- Navigate to the previous suggestion
                    dismiss = "<C-]>", -- Dismiss the suggestion
                },
            },
            filetypes = {
                -- Disable Copilot in these filetypes
                yaml = false,
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,          -- Disable Copilot in hidden files
            },
            copilot_node_command = 'node', -- Ensure Node.js version > 18.x
        })

        -- Copilot integration with nvim-cmp
        require("copilot_cmp").setup()
    end
}
