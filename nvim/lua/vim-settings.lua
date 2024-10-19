-- General Settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Relative line numbers
vim.opt.wrap = true            -- Enable line wrapping
vim.opt.tabstop = 4            -- Number of spaces tabs count for
vim.opt.shiftwidth = 4         -- Number of spaces for each indentation level
vim.opt.expandtab = true       -- Convert tabs to spaces
vim.opt.termguicolors = true   -- Enable true colors
vim.opt.cursorline = true      -- Highlight the current line
vim.opt.scrolloff = 7          -- Lines to keep above/below cursor
vim.opt.sidescrolloff = 7      -- Columns to keep left/right of cursor

-- Key Mappings
local keymap = vim.api.nvim_set_keymap
-- Telescope Keybindings
keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
keymap('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
keymap('n', '<C-b>', ':Telescope buffers<CR>', { noremap = true, silent = true })
keymap('n', '<C-h>', ':Telescope help_tags<CR>', { noremap = true, silent = true })
keymap('n', '<M-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<M-t>', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
-- Tab Management Keybindings
keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })
keymap('n', '<C-w>', ':tabclose<CR>', { noremap = true, silent = true })
-- Copilot Keybindings
vim.api.nvim_set_keymap('n', '<C-.>', '<cmd>Copilot panel<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-9>', '<cmd>Copilot previous<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-0>', '<cmd>Copilot next<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>Copilot dismiss<CR>', { noremap = true, silent = true })

