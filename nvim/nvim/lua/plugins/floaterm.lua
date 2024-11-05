return {
    'voldikss/vim-floaterm',
    cmd = { 'FloatermNew', 'FloatermToggle', 'FloatermKill' },
    config = function()
        vim.g.floaterm_shell = 'zsh'
    end,
}
