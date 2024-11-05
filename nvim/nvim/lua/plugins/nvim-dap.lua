return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		-- Example: Configure Python debugging
		dap.adapters.python = {
			type = "executable",
			command = "python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",  -- Debug the current file
				pythonPath = function()
					return "/usr/bin/python3"  -- Adjust this according to your Python setup
				end,
			},
		}
	end
}

