require("gruvbox").setup({
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = true,
		folds = true,
	},
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "soft", -- can be "hard", "soft" or empty string
	palette_overrides = {
		gray = "#a4a4a4",
	},
	overrides = {
		-- Removing color of punctuations
		["@punctuation.bracket"] = { fg = "NONE" },
		["@punctuation.parenthesis"] = { fg = "NONE" },
		["@constructor.lua"] = { fg = "NONE" },
		["@operator"] = { fg = "NONE" },

		-- Rust configurations
		["@type.builtin.rust"] = { link = "GruvboxOrange", italic = true },
		-- ["@constant.rust"] = { link = "GruvboxPurple", italic = true },
		["@operator.rust"] = { link = "GruvboxOrange", italic = true },
		["@function.identifier.rust"] = { fg = "#427b58" },
	},
	dim_inactive = true,
})

require("nightfox").setup({
        options = {
                styles = {
                        comments = "italic",

                },
                palettes = {
                        comment = "#a4a4a4",
                }
        }
})

vim.cmd("colorscheme duskfox")
