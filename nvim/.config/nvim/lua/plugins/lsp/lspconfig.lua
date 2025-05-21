return {
        'neovim/nvim-lspconfig',
        dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "mason-org/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",

                -- Useful status updates for LSP.
                { "j-hui/fidget.nvim", opts = {} },

                -- Allows extra capabilities provided by blink.cmp
                "saghen/blink.cmp",
        },
        config = function()
                require("blink.cmp").get_lsp_capabilities()
                vim.api.nvim_create_autocmd("LspAttach", {
                        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                        callback = function(event)
                        end
                })

                vim.diagnostic.config {
                        severity_sort = true,
                        float = { border = "rounded", source = "if_many" },
                        underline = { severity = vim.diagnostic.severity.ERROR },
                        signs = vim.g.have_nerd_font and {
                                text = {
                                        [vim.diagnostic.severity.ERROR] = '󰅚 ',
                                        [vim.diagnostic.severity.WARN] = '󰀪 ',
                                        [vim.diagnostic.severity.INFO] = '󰋽 ',
                                        [vim.diagnostic.severity.HINT] = '󰌶 ',
                                },
                        } or {},
                        virtual_text = {
                                source = 'if_many',
                                spacing = 2,
                                format = function(diagnostic)
                                        local diagnostic_message = {
                                                [vim.diagnostic.severity.ERROR] = diagnostic.message,
                                                [vim.diagnostic.severity.WARN] = diagnostic.message,
                                                [vim.diagnostic.severity.INFO] = diagnostic.message,
                                                [vim.diagnostic.severity.HINT] = diagnostic.message,
                                        }
                                        return diagnostic_message[diagnostic.severity]
                                end,
                        },
                }

                local capabilities = require("blink.cmp").get_lsp_capabilities()

                local servers = {
                        clangd = {
                                capabilities = capabilities,
                        },
                        lua_ls = {
                                -- cmd = { ... },
                                -- filetypes = { ... },
                                capabilities = capabilities,
                                settings = {
                                        Lua = {
                                                completion = {
                                                        callSnippet = "Replace",
                                                },
                                                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                                                -- diagnostics = { disable = { 'missing-fields' } },
                                        },
                                },
                        },
                        rust_analyzer = {
                                capabilities = capabilities,
                        }
                }

                local ensure_installed = vim.tbl_keys(servers or {})
                vim.list_extend(ensure_installed, {
                        'stylua', -- Used to format Lua code
                        "mypy",
                        "clang-format"
                })
                require('mason-tool-installer').setup { ensure_installed = ensure_installed }

                -- require('mason-lspconfig').setup {
                --         ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
                --         automatic_installation = false,
                --         handlers = {
                --                 function(server_name)
                --                         local server = servers[server_name] or {}
                --                         -- This handles overriding only values explicitly passed
                --                         -- by the server configuration above. Useful when disabling
                --                         -- certain features of an LSP (for example, turning off formatting for ts_ls)
                --                         server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                --                         require('lspconfig')[server_name].setup(server)
                --                 end,
                --         },
                -- }
        end,
}
