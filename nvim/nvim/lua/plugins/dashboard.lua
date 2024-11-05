-- ~/.config/nvim/lua/plugins/dashboard.lua
return {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- For icons support
    config = function()
        local db = require("dashboard")

        db.setup({
            theme = "doom", -- Theme for dashboard (doom-inspired)
            config = {
                -- Custom ASCII art in the header
                --[[  header = {
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "",
               "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
               "████╗  ██║██║   ██║██║████╗ ████║",
               "██╔██╗ ██║██║   ██║██║██╔████╔██║",
               "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
               "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
               "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
               "",
            }, ]]

                header = {
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "     ⢰⠶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠲⣄⠀ ",
                    "    ⣠⡟⠀⠈⠙⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⡶⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠾⠋⠁⠀⠀⢽⡄ ",
                    "  ⠀⠀⡿⠀⠀⠀⠀⠀⠉⠷⣄⣀⣤⠤⠤⠤⠤⢤⣷⡀⠙⢷⡄⠀⠀⠀⠀⣠⠞⠉⠀⠀⠀⠀⠀⠈⡇ ",
                    "  ⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠀⠀⠀⠀⠀⠈⠁⠀⠀⠹⣦⠀⣠⡞⠁⠀⠀⠀⠀⠀⠀⠀⠀⡗ ",
                    "  ⠀⣾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣻⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣏ ",
                    " ⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡇  ",
                    "  ⠀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠂ ",
                    "  ⠀⢿⠀⠀⠀⠀⣤⣤⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣤⣤⣤⡀⠀⠀⠀⠀⠀⣸⠇⠀ ",
                    " ⠀⠘⣇⠀⠀⠀⠀⠉⠉⠛⠛⢿⣶⣦⠀⠀⠀⠀⠀⠀⢴⣾⣟⣛⡋⠋⠉⠉⠁⠀⠀⠀⠀⣴⠏⠀⠀ ",
                    "  ⢀⣀⠙⢷⡄⠀⠀⣀⣤⣶⣾⠿⠋⠁⠀⢴⠶⠶⠄⠀⠀⠉⠙⠻⠿⣿⣷⣶⡄⠀⠀⡴⠾⠛⠛⣹⠇ ",
                    "  ⢸⡍⠉⠉⠉⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⣬⠷⣆⣠⡤⠄⢀⣤⠞⠁⠀ ",
                    "  ⠈⠻⣆⡀⠶⢻⣇⡴⠖⠀⠀⠀⣴⡀⣀⡴⠚⠳⠦⣤⣤⠾⠀⠀⠀⠀⠀⠘⠟⠋⠀⠀⠀⢻⣄⠀⠀ ",
                    "  ⠀⠀⣼⠃⠀⠀⠉⠁⠀⠀⠀⠀⠈⠉⢻⡆⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⠀⠀ ",
                    "  ⠀⢠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⣀⡿⠧⠿⠿⠟⠀⠀ ",
                    "  ⠀⣾⡴⠖⠛⠳⢦⣿⣶⣄⣀⠀⠀⠀⠀⠘⢷⣀⠀⣸⠃⠀⠀⠀⣀⣀⣤⠶⠚⠉⠀⠀⠀⠀⠀⠀⠀ ",
                    "  ⠀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠈⠻⠦⠀⠀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠹⣆⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
                    "  ⠀⠀⠀⠀⠀⠀⠀⢀⡴⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
                    "   ⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⡄⠀⠀⠀⠀⠀⠀⠀⠀ ",
                    "  ⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⢲⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀ ",
                    "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀ ",
                    "  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠀ ",
                },




                -- Center commands (keybindings and descriptions)
                center = {
                    {
                        icon = "  ", -- Icon for new file
                        desc = "New File                  ",
                        action = "enew",
                        key = "n"
                    },
                    {
                        icon = "󰌑  ", -- Icon for recent files
                        desc = "Recently opened files     ",
                        action = "Telescope oldfiles",
                        key = "h"
                    },
                    {
                        icon = "  ", -- Icon for find files
                        desc = "Find File                 ",
                        action = "Telescope find_files",
                        key = "f"
                    },
                    {
                        icon = "  ", -- Icon for file browser
                        desc = "File Browser              ",
                        action = "Telescope file_browser",
                        key = "b"
                    },
                    {
                        icon = "  ", -- Icon for live grep
                        desc = "Find word                 ",
                        action = "Telescope live_grep",
                        key = "w"
                    },
                    {
                        icon = "  ", -- Icon for opening dotfiles
                        desc = "Open Neovim dotfiles    ",
                        action = "edit ~/.config/nvim",
                        key = "d"
                    },
                },

                -- Footer showing the number of loaded plugins
                footer = { "Neovim loaded " .. vim.fn.len(vim.fn.globpath(vim.fn.stdpath("data") .. "/lazy", "*")) .. " plugins" }
            }
        })
    end
}
