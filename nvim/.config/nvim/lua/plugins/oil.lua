return {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
                require("oil").setup({
                        default_file_explorer = true,
                        keymaps = {
                                ["g?"] = { "actions.show_help", mode = "n" },
                                ["M-h"] = { "actions.select_split", mode = "n" },
                        },
                        view_options = {
                                show_hidden = true,
                        },
                })

                vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory with Oil" })
                vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle float Oil" })
        end
}
