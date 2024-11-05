return {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
    cmd = "Ufo",
    config = function()
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
            return {'treesitter', 'indent'}
        end
        })
    end,
}

