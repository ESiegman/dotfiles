return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate", -- Automatically update Treesitter parsers
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "python",
                "typescript",
                "rust",
                "java",
                "yaml",
            },                                 -- A list of parser names or "all"
            sync_install = false,              -- Install parsers synchronously (only applied to `ensure_installed`)
            auto_install = true,               -- Automatically install missing parsers when entering buffer
            highlight = {
                enable = true,                 -- Enable Treesitter-based highlighting
                disable = {},                  -- List of languages to disable
                additional_vim_regex_highlighting = false, -- Disable Vim regex highlighting
            },
            indent = {
                enable = true, -- Enable Treesitter-based indentation
            },
            incremental_selection = {
                enable = true,  -- Enable incremental selection based on Treesitter
                keymaps = {
                    init_selection = "gnn", -- Initialize incremental selection
                    node_incremental = "grn", -- Increment to the next node
                    scope_incremental = "grc", -- Increment to the next scope
                    node_decremental = "grm", -- Decrement selection
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to the text object
                    keymaps = {
                        ["af"] = "@function.outer", -- Select around a function
                        ["if"] = "@function.inner", -- Select inside a function
                        ["ac"] = "@class.outer", -- Select around a class
                        ["ic"] = "@class.inner", -- Select inside a class
                    },
                },
            },
        })
    end
}
