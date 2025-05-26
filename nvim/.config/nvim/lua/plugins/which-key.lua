return {
        {
                "folke/which-key.nvim",
                event = "VeryLazy",
        },
        {
                "VonHeikemen/searchbox.nvim",
                dependencies = {
                        "MunifTanjim/nui.nvim"
                },

                config = function()
                        vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')
                end
        },
}
