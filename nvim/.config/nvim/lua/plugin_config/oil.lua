require("oil").setup()

vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" })
