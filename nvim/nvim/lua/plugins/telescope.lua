return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-media-files.nvim"    -- Ensure media files extension is installed

   },  -- Required dependencies for Telescope

	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = " ",      -- Custom prompt prefix
				selection_caret = " ",    -- Custom selection caret
				path_display = { "truncate" },  -- Display file paths truncated
				file_ignore_patterns = { "node_modules", "%.git/*" },  -- Ignore specific file patterns
				layout_config = {
					width = 0.75,
					prompt_position = "top",  -- Position the prompt at the top
					preview_cutoff = 120,     -- Do not show preview if less than 120 columns
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				mappings = {
					i = {
						["<C-n>"] = require("telescope.actions").move_selection_next,  -- Move to next item in insert mode
						["<C-p>"] = require("telescope.actions").move_selection_previous,  -- Move to previous item in insert mode
						["<C-c>"] = require("telescope.actions").close,  -- Close Telescope in insert mode
					},
					n = {
						["<C-n>"] = require("telescope.actions").move_selection_next,  -- Move to next item in normal mode
						["<C-p>"] = require("telescope.actions").move_selection_previous,  -- Move to previous item in normal mode
						["<C-c>"] = require("telescope.actions").close,  -- Close Telescope in normal mode
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",  -- Use 'ivy' theme for file browser
					hijack_netrw = true,  -- Replace netrw with Telescope file browser
				},
			},
		})

		-- Load extensions for file_browser and media_files
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("media_files")
	end
}
