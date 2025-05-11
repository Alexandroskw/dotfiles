local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not (vim.uv or vim.loop).fs_stat(pckr_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/lewis6991/pckr.nvim",
			pckr_path,
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require("pckr").add({
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},
	"lukas-reineke/indent-blankline.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	"mason-org/mason.nvim",
	"mason-org/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	"EdenEast/nightfox.nvim",
	"ellisonleao/gruvbox.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { "nvim-lua/plenary.nvim" },
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	"christoomey/vim-tmux-navigator",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"rust-lang/rust.vim",
	"nvimtools/none-ls.nvim",
	"mrcjkb/rustaceanvim",
	"nvim-neotest/nvim-nio",
	"nvim-lua/plenary.nvim",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { "nvim-lua/plenary.nvim" },
	},
	"tpope/vim-fugitive",
	"nvim-tree/nvim-tree.lua",
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
	},
	"stevearc/dressing.nvim",
	{
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"stevearc/oil.nvim",
	{
		"VonHeikemen/searchbox.nvim",
		requires = { "MunifTanjim/nui.nvim" },
	},
})
