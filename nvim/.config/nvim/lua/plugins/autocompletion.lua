return {
    {
        -- autopairs
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        -- surround
        "kylechui/nvim-surround",
        version = "^4.0.0",
        event = "VeryLazy",
        config = function()
            require("which-key").add({
                mode = { "n" },
                { "ys",  desc = "Add surrounding" },
                { "yss", desc = "Add surrounding to current line" },
                { "yS",  desc = "Add surrounding on new lines" },
                { "ySS", desc = "Add surrounding on new lines to current line" },
                { "ds",  desc = "Delete surrounding" },
                { "cs",  desc = "Change surrounding" },
                { "cS",  desc = "Change surrounding on new lines" },
            })

            require("which-key").add({
                mode = { "v" },
                { "S",  desc = "Add surrounding to selection" },
                { "gS", desc = "Add surrounding to selection on new lines" },
            })           require("nvim-surround").setup({})
        end
    },
    {
        -- Comments
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup({})
        end
    },
    {
        -- blankline
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
}
