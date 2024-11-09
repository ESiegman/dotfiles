-- General Settings
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = true           -- Enable line wrapping
vim.opt.tabstop = 4           -- Number of spaces tabs count for
vim.opt.shiftwidth = 4        -- Number of spaces for each indentation level
vim.opt.expandtab = true      -- Convert tabs to spaces
vim.opt.termguicolors = true  -- Enable true colors
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.scrolloff = 7         -- Lines to keep above/below cursor
vim.opt.sidescrolloff = 7     -- Columns to keep left/right of cursor

-- Key Mappings
local keymap = vim.api.nvim_set_keymap

-- Leader Key
vim.g.mapleader = " "

-- Telescope Keybindings with <leader> key
keymap('n', '<leader>f', ':Telescope live_grep<CR>', { noremap = true, silent = true })  -- Search in files
keymap('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })    -- Open buffers
keymap('n', '<leader>h', ':Telescope help_tags<CR>', { noremap = true, silent = true })  -- Help tags

-- NvimTree and ToggleTerm
keymap('n', '<M-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<M-t>', ':ToggleTerm direction=float<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>a',
    [[:lua if vim.fn.expand('%:p') ~= '' then vim.cmd('FloatermNew --cwd=' .. vim.fn.expand('%:p:h')) else print("No file path available!") end<CR>]],
    { noremap = true, silent = true, expr = false })

-- Tab Management Keybindings
keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })
keymap('n', '<C-l>', ':tabnext<CR>', { noremap = true, silent = true })
keymap('n', '<C-h>', ':tabprevious<CR>', { noremap = true, silent = true })
keymap('n', '<C-w>', ':tabclose<CR>', { noremap = true, silent = true })

-- Optional Copilot Keybinding with <leader> key
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>Copilot panel<CR>', { noremap = true, silent = true })

-- Neogen Keybindings for Documentation
vim.api.nvim_set_keymap('n', '<leader>d', ':Neogen<CR>', { noremap = true, silent = true })

-- Vimtex Keybindings with Alt-v variations
vim.api.nvim_set_keymap("n", "<A-v>l", ":VimtexCompile<CR>", { noremap = true, silent = true })  -- Alt-v, l
vim.api.nvim_set_keymap("n", "<A-v>v", ":VimtexView<CR>", { noremap = true, silent = true })     -- Alt-v, v
vim.api.nvim_set_keymap("n", "<C-A-v>c", ":VimtexClean<CR>", { noremap = true, silent = true })  -- Ctrl-Alt-v, c

