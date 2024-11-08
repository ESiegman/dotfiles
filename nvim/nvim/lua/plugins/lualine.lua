-- lualine.lua

return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "folke/noice.nvim", -- Noice integration
    },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = require("neopywal").colorscheme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    {
                        require("noice").api.status.search.get,
                        cond = require("noice").api.status.search.has,
                        color = { fg = "#ff9e64" }, -- Optional: customize color
                    },
                    { 'filename' },
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = {},
        })
    end,
}
