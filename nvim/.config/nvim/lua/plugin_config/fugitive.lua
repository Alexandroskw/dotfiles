vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>gd", ":Git diff %<CR>", { desc = "Git diff actual file" })
