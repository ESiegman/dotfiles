return {
    -- Mason plugin for managing external tools
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", -- Ensure nvim-lspconfig is installed as a dependency
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", -- Lua Language Server
                "pyright", -- Python LSP
                "clangd", -- C/C++ LSP
                "ts_ls",  -- Correct TypeScript/JavaScript LSP name (updated from tsserver)
                "gopls",  -- Go LSP
                "rust_analyzer", -- Rust LSP
                "bashls", -- Bash LSP
                "jdtls",  -- Java LSP
                "html",   -- HTML LSP
                "cssls",  -- CSS LSP
                "jsonls", -- JSON LSP
                "nil_ls", -- Nil LSP 
            },
        })

        -- Configure LSP Servers using nvim-lspconfig
        local lspconfig = require("lspconfig")

        -- Lua LSP configuration
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }, -- Recognize 'vim' as a global in Lua
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        -- Other LSP server setups...
        lspconfig.pyright.setup {} -- Python LSP
        lspconfig.clangd.setup {}  -- C/C++ LSP
        lspconfig.ts_ls.setup {}   -- TypeScript/JavaScript LSP (updated from tsserver)
        lspconfig.gopls.setup {}   -- Go LSP
        lspconfig.rust_analyzer.setup {} -- Rust LSP
        lspconfig.bashls.setup {}  -- Bash LSP
        lspconfig.jdtls.setup {}   -- Java LSP
        lspconfig.html.setup {}    -- HTML LSP
        lspconfig.cssls.setup {}   -- CSS LSP
        lspconfig.jsonls.setup {}  -- JSON LSP
        lspconfig.nil_ls.setup {}  -- Nix LSP
    end
}
