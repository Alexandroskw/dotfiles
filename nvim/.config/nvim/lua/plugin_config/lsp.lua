local lsp_zero = require("lsp-zero")
--lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright" },
	handlers = {
		function(lua_ls)
			require("lspconfig")[lua_ls].setup({})
		end,
		function(pyright)
			require("lspconfig")[pyright].setup({})
		end,
	},
})
