local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search git files" })
vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Grep word" })
