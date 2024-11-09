return {
    "samodostal/image.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("image").setup({
            render = {
                min_padding = 5,  -- Minimum padding around the image
                show_label = true, -- Show image label
                show_image_dimensions = true, -- Display image dimensions
                use_dither = true, -- Apply dithering to images
                foreground_color = false,
                background_color = false,
            },
            events = {
                update_on_nvim_resize = true, -- Update image when the window is resized
            },
        })
    end
}
