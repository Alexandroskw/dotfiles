return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
    },

    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                path_display = {"smart"},
            }
        })

        vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Search files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search git files" })
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep word" })
    end
}
