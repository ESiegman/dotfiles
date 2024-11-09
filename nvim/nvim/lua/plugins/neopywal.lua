local function apply_pywal_colors()
    local handle = io.popen("cat ~/.cache/wal/colors.json")
    local result = handle:read("*a")
    handle:close()

    local success, colors = pcall(vim.fn.json_decode, result)
    if not success then
        print("Error: Failed to decode pywal colors")
        return
    end

    -- Apply the background and foreground colors
    vim.api.nvim_set_hl(0, "Normal", { bg = colors['colors']['color0'], fg = colors['colors']['color7'] })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors['colors']['color0'] })
end

return {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    config = function()
        require("neopywal").setup()
        apply_pywal_colors() -- Automatically apply pywal colors without transparency
    end
}
