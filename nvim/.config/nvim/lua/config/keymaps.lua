vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.clipboard = "unnamedplus" -- clipboard for copy paste between other apps and neovim

-- Tabs indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.scrolloff = 10

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
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Remove the highlights of the search mode" })

-- Autoformat rust code when the file is saved or closed
vim.g.rustfmt_autosave = 1

-- Tabs
vim.keymap.set("n", "<leader>t", ":tabedit<CR>", { desc = "New Tab" }) -- New tab
vim.keymap.set("n", "<leader>ss", ":split<CR><C-w>w", { desc = "Split window horizontal" }) -- Split horizontal
vim.keymap.set("n", "<leader>vs", ":vsplit<CR><C-w>w", { desc = "Split window vertical" }) -- Split vertical

-- move between windows
vim.keymap.set("n", "<leader>b", "<C-w>w", { desc = "Move to previous window" })
vim.keymap.set("", "<leader>h", "<C-w>h", { desc = "Move left between neovim window" })
vim.keymap.set("", "<leader>l", "<C-w>l", { desc = "Move right between neovim window"})
vim.keymap.set("", "<leader>j", "<C-w>j", { desc = "Move down between neovim window" })
vim.keymap.set("", "<leader>k", "<C-w>k", { desc = "Move up between neovim window" })
