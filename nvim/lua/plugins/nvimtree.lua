return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },  -- Optional dependency for icons
	config = function()
		require("nvim-tree").setup({
			disable_netrw = true,       -- Disables Netrw to use NvimTree instead
			hijack_netrw = true,        -- Automatically open NvimTree on startup
			open_on_tab = false,
			update_cwd = true,          -- Update the root directory of the tree
			renderer = {
				icons = {
					glyphs = {
						default = "",      -- Default file icon
						symlink = "",      -- Symlink icon
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌"
						},
						folder = {
							default = "",   -- Default folder icon
							open = "",      -- Open folder icon
							empty = "",     -- Empty folder icon
							empty_open = "",
							symlink = "",
						}
					}
				}
			},
			view = {
				width = 30,               -- Width of the NvimTree window
				side = "left",            -- Which side to open the NvimTree on
			},
			git = {
				enable = true,            -- Enable git integration
				ignore = false,           -- Do not ignore files in git
			},
			actions = {
				open_file = {
					quit_on_open = true,   -- Close NvimTree after opening a file
				}
			}
		})
	end
}

