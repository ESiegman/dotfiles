return {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    config = function()
        require("toggleterm").setup({
            size = 20,       -- Height of the terminal window
            open_mapping = [[<c-\>]], -- Keybinding to toggle terminal
            shading_factor = 2, -- Shading for the terminal
            direction = "horizontal", -- Terminal direction: horizontal, vertical, tab, or float
        })
    end
}
