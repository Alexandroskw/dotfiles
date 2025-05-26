return {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
                local lualine = require("lualine.themes.nord")
                local status = require("lazy.status")

                local colors = {
                        nord9 = "#81a1c1",
                        nord10 = "#5e81ac",
                        nord11 = "#bf616a",
                        nord13 = "#ebcb8b",
                        nord12 = "#d08770",
                        grey1 = "#262626",
                        grey2 = "#444444",
                        grey3 = "#585858",
                }

                local color_scheme = {
                        normal = {
                                a = { bg = "#81a1c1", fg = "#262626", gui = "bold" },
                                b = { bg = "#444444" },
                                c = { bg = "#585858" },
                                z = { bg = "#81a1c1", fg = "#262626", gui = "bold" }
                        },
                        insert = {
                                a = { bg = "#5e81ac", fg = "#262626", gui = "bold" },
                                b = { bg = "#444444" },
                                c = { bg = "#585858" },
                                z = { bg = "#5e81ac", fg = "#262626", gui = "bold" },
                        },
                        visual = {
                                a = { bg = "#bf616a", fg = "#262626", gui = "bold" },
                        },
                        replace = {
                                a = { bg = "#ebcb8b", fg = "#262626", gui = "bold" }
                        },
                        command = {
                                a = { bg = "#d08770", fg = "#262626", gui = "bold" }
                        },
                }

                lualine.setup({
                        icons_enabled = true,
                        options = {
                                theme = color_scheme,
                                component_separators = { left = "", right = "" },
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
}
