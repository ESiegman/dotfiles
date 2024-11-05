return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")

        -- Setup configuration for conform
        conform.setup({
            formatters_by_ft = {
                python = { "black", "isort" },   -- Black and Isort for Python formatting
                c = { "clang_format" },          -- Clang-Format for C
                cpp = { "clang_format" },        -- Clang-Format for C++
                java = { "google_java_format" }, -- Google Java Formatter for Java
                lua = { "stylua" },              -- Stylua for Lua formatting
                sh = { "shfmt" },                -- shfmt for Shell scripts (.sh)

                -- Add other languages here
                javascript = { "prettier" }, -- Prettier for JavaScript
                typescript = { "prettier" }, -- Prettier for TypeScript
                json = { "jq" },             -- JQ for JSON
                html = { "prettier" },       -- Prettier for HTML
                css = { "prettier" },        -- Prettier for CSS
                markdown = { "prettier" },   -- Prettier for Markdown
            },
        })

        -- Set up keybinding for Alt+F to format
        vim.api.nvim_set_keymap(
            "n",                                                                         -- Normal mode
            "<M-f>",                                                                     -- Alt + F
            ":lua require('conform').format({ async = true, lsp_fallback = true })<CR>", -- Formatting command
            { noremap = true, silent = true }
        )
    end,
}
