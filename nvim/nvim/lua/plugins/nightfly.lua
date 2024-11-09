return {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,                       -- Load the theme immediately
    priority = 1000,                    -- Ensure it loads early
    config = function()
        vim.cmd([[colorscheme nightfly]]) -- Apply the colorscheme
    end
}
