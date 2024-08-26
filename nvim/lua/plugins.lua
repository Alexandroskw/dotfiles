local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
                fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
                vim.cmd([[packadd packer.nvim]])
                return true
        end
        return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
        use("wbthomason/packer.nvim")
        use {
                'goolord/alpha-nvim',
                config = function()
                        require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
                end
        }
        use("lukas-reineke/indent-blankline.nvim")
        use("nvim-lualine/lualine.nvim")
        use("nvim-tree/nvim-web-devicons")
        use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
        use({
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "neovim/nvim-lspconfig",
        })
        use("EdenEast/nightfox.nvim")
        use("lewis6991/gitsigns.nvim")
        use({
                "nvim-telescope/telescope.nvim",
                tag = "0.1.8",
                -- or                            , branch = '0.1.x',
                requires = { { "nvim-lua/plenary.nvim" } },
        })
        use({
                "VonHeikemen/lsp-zero.nvim",
                branch = "v3.x",
                requires = {
                        --- Uncomment the two plugins below if you want to manage the language servers from neovim
                        -- {'williamboman/mason.nvim'},
                        -- {'williamboman/mason-lspconfig.nvim'},

                        { "hrsh7th/nvim-cmp" },
                        { "hrsh7th/cmp-nvim-lsp" },
                        { "L3MON4D3/LuaSnip" },
                },
        })
        use("christoomey/vim-tmux-navigator")
        use("mfussenegger/nvim-dap")
        use("rcarriga/nvim-dap-ui")
        use("rust-lang/rust.vim")
        use("nvimtools/none-ls.nvim")
        use("mrcjkb/rustaceanvim")
        use("nvim-neotest/nvim-nio")
        use("nvim-lua/plenary.nvim")
        use({
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
                requires = { { "nvim-lua/plenary.nvim" } },
        })
        use("tpope/vim-fugitive")
        use("nvim-tree/nvim-tree.lua")
        -- My plugins here
        -- use 'foo1/bar1.nvim'
        -- use 'foo2/bar2.nvim'

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
                require("packer").sync()
        end
end)
