local lsp_zero = require("lsp-zero")
--lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({
	ui = {
		icons = {
			server_installed = "󰸞",
			server_pending = "",
			server_uninstalled = "",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "pyright", "clangd" },
	handlers = {
		lsp_zero.default_setup,

		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})
		end,
	},
})
