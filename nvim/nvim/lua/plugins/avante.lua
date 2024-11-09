-- avante.nvim
-- A plugin for AI-powered code editing in Neovim (Sidebar)

return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Always pull the latest version
    build = "make",  -- Build from source
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "zbirenbaum/copilot.lua", -- Copilot integration
    },
    config = function()
        require("avante").setup({
            provider = "copilot",         -- Set Copilot as the AI provider
            behaviour = {
                auto_suggestions = false, -- Disable auto-suggestions if not needed
            },
            mappings = {
                ask = "<leader>aa",     -- Map for asking AI
                edit = "<leader>ae",    -- Map for editing with AI
                refresh = "<leader>ar", -- Map for refreshing AI suggestions
            },
        })
    end,
}
