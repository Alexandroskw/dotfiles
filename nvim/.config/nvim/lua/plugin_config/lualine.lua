local color = require("lualine.themes.nord")

color.normal = {
        a = { bg = "#81a1c1", fg = "#262626", gui = "bold" },
        b = { bg = "#444444" },
        c = { bg = "#585858" },
        z = { bg = "#81a1c1", fg = "#262626", gui = "bold" }
}
color.insert = {
        a = { bg = "#5e81ac", fg = "#262626", gui = "bold" },
        b = { bg = "#444444" },
        c = { bg = "#585858" },
        z = { bg = "#5e81ac", fg = "#262626", gui = "bold" },
}
color.visual = {
        a = { bg = "#bf616a", fg = "#262626", gui = "bold" },
}
color.replace = {
        a = { bg = "#ebcb8b", fg = "#262626", gui = "bold" }
}
color.command = {
        a = { bg = "#d08770", fg = "#262626", gui = "bold" }
}

require("lualine").setup({
        options = {
                theme = color,
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
