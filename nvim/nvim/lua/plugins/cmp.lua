return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- LSP completions
        "hrsh7th/cmp-buffer",   -- Buffer completions
        "hrsh7th/cmp-path",     -- Path completions
        "hrsh7th/cmp-cmdline",  -- Command line completions
        "hrsh7th/vim-vsnip",    -- Snippet engine
        "zbirenbaum/copilot-cmp", -- Copilot completions
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- Use vsnip for snippets
                end,
            },
            mapping = {
                ['<C-p>'] = cmp.mapping.select_prev_item(),     -- Navigate up in completion menu
                ['<C-n>'] = cmp.mapping.select_next_item(),     -- Navigate down in completion menu
                ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP completions
                { name = "vsnip" }, -- Snippet completions
                { name = "copilot" }, -- GitHub Copilot completions
            }, {
                { name = "buffer" }, -- Buffer completions
                { name = "path" }, -- File path completions
                { name = "cmdline" }, -- Command line completions
            })
        })

        -- Setup for `/` (search) to use buffer completion
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        -- Setup for `:` (command-line mode) to use path and cmdline completion
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })
    end
}
