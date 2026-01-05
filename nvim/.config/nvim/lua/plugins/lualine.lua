return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local lualine = require("lualine")
            local status = require("lazy.status")

            local palette = {
                nord9 = "#81a1c1",
                nord10 = "#5e81ac",
                nord11 = "#bf616a",
                nord12 = "#d08770",
                nord13 = "#ebcb8b",
                grey1 = "#262626",
                grey2 = "#444444",
                grey3 = "#585858",
            }

            local lualine_palette = {
                normal = {
                    a = { bg = palette.nord9, fg = palette.grey1, gui = "bold" },
                    b = { bg = palette.grey2 },
                    c = { bg = palette.grey1 },
                    z = { bg = palette.nord9, fg = palette.grey1, gui = "bold" }
                },
                insert = {
                    a = { bg = palette.nord10, fg = palette.grey1, gui = "bold" },
                    b = { bg = palette.grey2 },
                    c = { bg = palette.grey3 },
                    z = { bg = palette.nord10, fg = palette.grey1, gui = "bold" },
                },
                visual = {
                    a = { bg = palette.nord11, fg = palette.grey1, gui = "bold" },
                    z = { bg = palette.nord11, fg = palette.grey1, gui = "bold" },
                },
                replace = {
                    a = { bg = palette.nord13, fg = palette.grey1, gui = "bold" },
                    z = { bg = palette.nord13, fg = palette.grey1, gui = "bold" },
                },
                command = {
                    a = { bg = palette.nord12, fg = palette.grey1, gui = "bold" },
                    z = { bg = palette.nord12, fg = palette.grey1, gui = "bold" },
                },
            }

            lualine.setup({
                icons_enabled = true,
                options = {
                    theme = lualine_palette,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {},
                    always_divide_middle = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
            })
        end
    },
}
