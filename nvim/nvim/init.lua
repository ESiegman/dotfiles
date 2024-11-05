-- Install and set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
   vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
   })
end

vim.opt.rtp:prepend(lazypath)
-- Import nvim settings
require("vim-settings")

-- Setup plugins
require("lazy").setup("plugins")

vim.cmd.colorscheme("neopywal")
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.fn.setreg("/", "")  -- Clear search register to avoid `E35` error
    end,
})

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.fn.setreg("/", "dummyPattern")  -- Set a default pattern to prevent E35 errors
    end,
})
vim.api.nvim_create_autocmd("TextChangedI", {
    pattern = "*",
    callback = function()
        local line = vim.api.nvim_get_current_line()
        if line:match("^/") then
            vim.fn.setreg("/", "dummyPattern")  -- Avoids E35 by setting a dummy pattern
        end
    end,
})

