return {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons", opt = true },  -- Optional dependency for filetype icons
   config = function()
      require('lualine').setup({
         options = {
            icons_enabled = true,  -- Enable icons
            theme = 'nightfly',
            component_separators = { left = '', right = '' },  -- Separators for each component
            section_separators = { left = '', right = '' },    -- Separators for each section
            disabled_filetypes = {},  -- You can disable it for certain filetypes
            always_divide_middle = true,  -- Ensures the middle section is always divided
         },
         sections = {
            lualine_a = { 'mode' },  -- Shows the current mode (normal, insert, etc.)
            lualine_b = { 'branch', 'diff', {
               'diagnostics',
               sources = { "nvim_diagnostic" },
               symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            }},
            lualine_c = { 'filename' },  -- Shows the current file name
            lualine_x = { 'encoding', 'fileformat', 'filetype' },  -- Shows encoding, file format, and filetype
            lualine_y = { 'progress' },  -- Shows progress in the file (percentage)
            lualine_z = { 'location' },  -- Shows line and column numbers
         },
         inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },  -- Show filename for inactive windows
            lualine_x = { 'location' },  -- Show line and column for inactive windows
            lualine_y = {},
            lualine_z = {},
         },
         tabline = {},  -- If you want to customize the tabline
         extensions = {},  -- You can add extensions like 'nvim-tree', 'quickfix', etc.
      })
   end
}

