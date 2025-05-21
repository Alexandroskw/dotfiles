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
                version = "^3.0.0",
                event = "VeryLazy",
                config = function()
                        require("nvim-surround").setup({})
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
