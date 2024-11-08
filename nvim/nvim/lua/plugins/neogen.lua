-- neogen.lua

return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter", -- Treesitter is required for syntax parsing
    config = function()
        require("neogen").setup({
            enabled = true, -- enable the plugin
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings" -- Use Google style docstrings
                    }
                },
                lua = {
                    template = {
                        annotation_convention = "emmylua" -- Use EmmyLua style for Lua
                    }
                },
                cpp = {
                    template = {
                        annotation_convention = "doxygen" -- Use Doxygen for C++
                    }
                },
                -- Add more languages and their conventions as needed
            }
        })
    end,
    cmd = { "Neogen" }, -- Load Neogen on command
}
