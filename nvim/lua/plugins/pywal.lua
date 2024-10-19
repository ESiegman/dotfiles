-- pywal.nvim plugin setup in a modular setup
return {
   'AlphaTechnolog/pywal.nvim',
   config = function()
      require('pywal').setup({
         theme = 'wal',  -- Sync with pywal theme
         background = 'dark',  -- Set according to your preference
      })

      -- Auto reload pywal colors when they change
      vim.cmd([[
         augroup pywal_colors
            autocmd!
            autocmd BufWritePost ~/.cache/wal/colors.lua source ~/.cache/wal/colors.lua | lua require('pywal').setup()
         augroup end
      ]])
   end,
}

