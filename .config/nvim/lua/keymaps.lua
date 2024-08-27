vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.cmd("colorscheme duskfox")

-- Tabs indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Move selected lines up or down. (This section was copied from ThePrimeagen lol) --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keeps the cursor in the middle with jump page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keeps the cursor in the middle in search mode
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- End of section --

-- Remove the highlights of the search mode
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Autoformat rust code when the file is saved or closed
vim.g.rustfmt_autosave = 1

-- Transparent screen
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
