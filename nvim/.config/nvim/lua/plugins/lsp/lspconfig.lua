return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup({
                        ui = {
                            icons = {
                                package_installed = "✓",
                                package_pending = "➜",
                                package_uninstalled = "✗"
                            }
                        }
                    })
                end
            },
            "mason-org/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim", opts = {} },
            "saghen/blink.cmp",
        },
        config = function()
            -- Configurar handlers
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                vim.lsp.handlers.hover, {
                    border = "rounded"
                }
            )

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
                vim.lsp.handlers.signature_help, {
                    border = "rounded"
                }
            )

            vim.opt.updatetime = 250
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Configurar autocomando para cuando LSP se conecte
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(event)
                    local opts = { buffer = event.buf, silent = true }
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show the documentation" })
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "Go to definition" })
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "Go to references" })
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Signature help" })
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts, { desc = "Rename" })
                    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts, { desc = "Code actions" })
                    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts, { desc = "Previous diagnostic" })
                    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts, { desc = "Next diagnostic" })
                    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts, { desc = "Show diagnostic float" })
                end
            })

            -- Configurar diagnósticos
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
                        return diagnostic.message
                    end,
                },
            }

            -- Obtener capabilities de blink.cmp
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Definir configuración de servidores LSP
            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                            diagnostics = {
                                globals = { 'vim' }
                            }
                        },
                    },
                },
                clangd = {},
                pyright = {},
                rust_analyzer = {},
                emmet_language_server = {
                    filetypes = {
                        "css",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "sass",
                        "scss"
                    },
                }
            }

            -- Configurar mason-lspconfig PRIMERO
            require('mason-lspconfig').setup {
                ensure_installed = vim.tbl_keys(servers),
                automatic_installation = true,
                handlers = {
                    -- Handler por defecto para todos los servidores
                    function(server_name)
                        local server_config = servers[server_name] or {}
                        server_config.capabilities = vim.tbl_deep_extend(
                            'force',
                            {},
                            capabilities,
                            server_config.capabilities or {}
                        )
                        require('lspconfig')[server_name].setup(server_config)
                    end,
                }
            }

            -- Instalar herramientas adicionales (formateadores, linters, etc)
            require('mason-tool-installer').setup {
                ensure_installed = {
                    'stylua',
                    'clang-format',
                    'mypy',
                }
            }
        end,
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function ()
            vim.diagnostic.config({
                virtual_text = false,
            })
            vim.keymap.set("", "<leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
        end
    },
}
