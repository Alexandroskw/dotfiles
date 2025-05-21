-- Configuración simplificada para rustaceanvim
vim.g.rustaceanvim = {
	-- Configuración del servidor
	server = {
		on_attach = function(client, bufnr)
			-- Habilitar format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})

			-- Configurar keymaps
			local opts = { buffer = bufnr, noremap = true, silent = true }
			vim.keymap.set("n", "<leader>k", function()
				vim.cmd("RustLsp hover actions")
			end, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		end,

		-- Opciones del servidor Rust Analyzer
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
				cargo = {
					allFeatures = true,
				},
			},
		},
	},

	-- Configuración de DAP (Debug Adapter Protocol)
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}
