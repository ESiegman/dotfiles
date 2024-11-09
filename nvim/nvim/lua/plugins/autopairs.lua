-- autopairs.nvim
-- A plugin for auto-pairing brackets, quotes, and other characters in Neovim

return {
    "windwp/nvim-autopairs",
    config = function()
        -- Load and configure the nvim-autopairs plugin
        require('nvim-autopairs').setup({
            check_ts = true, -- Enable Treesitter integration for better performance
        })

        -- If you are using nvim-cmp, this will add autopairs completion
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')

        -- Set up an event listener for nvim-cmp to integrate with nvim-autopairs
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end
}
