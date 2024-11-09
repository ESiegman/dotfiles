-- vimtex.lua

return {
    "lervag/vimtex",
    ft = { "tex", "latex" },                     -- Load only for TeX files
    config = function()
        vim.g.vimtex_view_method = "zathura"     -- Set your preferred PDF viewer (e.g., zathura, skim, evince)
        vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for continuous compilation

        -- Configure other settings
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-pdf",                     -- Generate PDF output
                "-shell-escape",            -- Enable shell escape if required by packages like minted
                "-interaction=nonstopmode", -- Avoid stopping for errors
                "-synctex=1",               -- Enable synctex for forward/reverse search
            },
        }

        -- Set up forward/reverse search with Zathura
        vim.g.vimtex_view_general_viewer = "zathura"
        vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    end,
}
