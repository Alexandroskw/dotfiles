return {
        {
                "mason-org/mason.nvim",
                config = function()
                        require("mason").setup({
                                ui = {
                                        icons = {
                                                package_installed = "",
                                                package_pending = "󰚰",
                                                package_uninstalled = ""
                                        }
                                }
                        })
                end
        },
        {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                        ensure_installed = {
                                "lua_ls",
                                "clangd",
                                "pyright",
                                "clang-format"
                        },
                },
                dependencies = {
                        { "mason-org/mason.nvim", opts = {} },
                        "neovim/nvim-lspconfig",
                },

                config = function()
                        require("mason-lspconfig").setup {
                                automatic_enable = {
                                        "lua_ls",
                                        "clangd",
                                        "python",
                                        "rust",
                                        "markdown",
                                        "ruby",
                                        "vimls"
                                }
                        }
                end
        },
}
