return {
   "windwp/nvim-autopairs",
   config = function()
      require('nvim-autopairs').setup({
         check_ts = true,  -- Enable Treesitter integration for better performance
      })

      -- If you are using nvim-cmp, this will add autopairs completion
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
         'confirm_done',
         cmp_autopairs.on_confirm_done()
      )
   end
}
