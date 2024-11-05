return {
   "akinsho/bufferline.nvim",
   version = "*",  -- You can specify a specific version or use "*" for the latest
   dependencies = { "nvim-tree/nvim-web-devicons" },  -- Dependency for icons
   config = function()
      require("bufferline").setup({
         options = {
            numbers = "ordinal",  -- Display buffer numbers as ordinals
            diagnostics = "nvim_lsp",  -- Use LSP diagnostics in the bufferline
            separator_style = "slant",  -- Adds a slant style between buffers
            show_buffer_icons = true,  -- Show icons in the bufferline
            show_buffer_close_icons = true,  -- Show the close button for buffers
            show_close_icon = false,  -- No close icon for the bufferline itself
            diagnostics_indicator = function(count, level)
               local icon = level:match("error") and " " or " "
               return " " .. icon .. count
            end,
         },
      })
   end
}
