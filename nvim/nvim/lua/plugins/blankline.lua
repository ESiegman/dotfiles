return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},

    config = function()
        require("ibl").setup {
            exclude = {
                filetypes = {
                    'help',
                    'startify',
                    'aerial',
                    'alpha',
                    'dashboard',
                    'packer',
                    'neogitstatus',
                    'NvimTree',
                    'neo-tree',
                    'Trouble',
                },
                buftypes = {
                    'nofile',
                    'terminal',
                },
            },
            scope = {
                enabled = false, -- Disables context or scope highlighting if available
            },
        }
    end,
}
