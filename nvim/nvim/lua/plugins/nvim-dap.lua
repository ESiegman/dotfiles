-- nvim-dap.lua
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
                program = "${file}", -- Debug the current file
                pythonPath = function()
                    return "/usr/bin/python3" -- Adjust this according to your Python setup
                end,
            },
        }

        -- Integrate dap with noice
        dap.listeners.after.event_initialized["noice"] = function()
            require("noice").notify("Debugging session started", "info")
        end
        dap.listeners.before.event_terminated["noice"] = function()
            require("noice").notify("Debugging session terminated", "warn")
        end
        dap.listeners.before.event_exited["noice"] = function()
            require("noice").notify("Debugging session exited", "error")
        end
    end,
}
