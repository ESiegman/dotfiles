-- ~/.config/nvim/lua/plugins/baleia.lua
return {
	"m00qek/baleia.nvim",
	version = "*",
	config = function()
		local baleia = require("baleia").setup({
			-- Optional: configuration settings for Baleia
		})

		-- Command to colorize the current buffer
		vim.api.nvim_create_user_command("BaleiaColorize", function()
			baleia.once(vim.api.nvim_get_current_buf())
		end, { bang = true })

		-- Command to show logs
		vim.api.nvim_create_user_command("BaleiaLogs", function()
			baleia.logger.show()
		end, { bang = true })
	end
}

