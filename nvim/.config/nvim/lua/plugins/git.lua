return {
        {
                "tpope/vim-fugitive",
                config = function()
                        vim.keymap.set("n", "<leader>gd", ":git diff %<CR>", { desc = "git diff actual file" })
                        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
                end
        },
        {
                "lewis6991/gitsigns.nvim",
                config = function()
                        require('gitsigns').setup()

                        vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
                        vim.keymap.set('n', '<leader>tb', ':Gitsigns toggle_current_line_blame<CR>', {})
                end

        },
}
