-- baleia.nvim
-- A plugin to colorize logs in Neovim using Lua

return {
    "m00qek/baleia.nvim",
    version = "*",
    config = function()
        -- Require and setup Baleia with optional configuration settings
        local baleia = require("baleia").setup({
            -- Optional: configuration settings for Baleia
        })

        -- Command to colorize the current buffer
        vim.api.nvim_create_user_command("BaleiaColorize", function()
            -- Apply colorization to the current buffer
            baleia.once(vim.api.nvim_get_current_buf())
        end, { bang = true })

        -- Command to show logs
        vim.api.nvim_create_user_command("BaleiaLogs", function()
            -- Show the logs using Baleia's logger
            baleia.logger.show()
        end, { bang = true })
    end
}
