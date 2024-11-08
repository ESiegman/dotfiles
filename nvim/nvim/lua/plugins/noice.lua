return {
    "folke/noice.nvim",
    event = "VimEnter",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            messages = {
                view = "mini",
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        })

        -- Lualine integration
        require('lualine').setup {
            sections = {
                lualine_c = {
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                    },
                    { "filename" },
                },
            },
        }
    end,
}
