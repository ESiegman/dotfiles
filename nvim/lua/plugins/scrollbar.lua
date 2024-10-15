return {
	"petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup({
			show = true,                -- Enable scrollbar
			handle = {
				color = "#6b7280",      -- Color of the scrollbar handle
            blend = 30,             -- Transparency of the scrollbar handle
			},
			marks = {
				Search = { color = "#f59e0b" },  -- Color for search results
				Error = { color = "#ef4444" },   -- Color for errors
				Warn = { color = "#f97316" },    -- Color for warnings
				Info = { color = "#3b82f6" },    -- Color for info
				Hint = { color = "#10b981" },    -- Color for hints
				Misc = { color = "#7c3aed" },    -- Color for miscellaneous marks
			},
			excluded_filetypes = {         -- Filetypes to exclude from showing scrollbar
				"prompt",
				"TelescopePrompt",
			},
			autocmd = {
				enabled = true,             -- Enable automatic updates
			},
		})
	end
}
