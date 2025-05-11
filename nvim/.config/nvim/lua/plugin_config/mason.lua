require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"clangd",
	},
})

handlers = {
	["lua_ls"] = function()
		require("lspconfig")[lua_ls].setup({})
	end,
	["pyright"] = function()
		require("lspconfig")[pyright].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { "python" },
		})
	end,
	["clangd"] = function()
		require("lspconfig").clangd.setup({})
	end,
}

vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Install new package with Mason" })
