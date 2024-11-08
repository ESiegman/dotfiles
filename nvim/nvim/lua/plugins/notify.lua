-- notify.lua

return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            stages = "fade_in_slide_out", -- animation style
            timeout = 3000,          -- time in milliseconds before notification disappears
            background_colour = "#000000", -- background color for notifications
            icons = {
                ERROR = "",
                WARN = "",
                INFO = "",
                DEBUG = "",
                TRACE = "✎",
            },
        })
        -- Set nvim-notify as the default notification manager
        vim.notify = require("notify")
    end,
}
