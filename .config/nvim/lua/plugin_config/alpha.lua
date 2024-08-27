local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
        "      ___           ___           ___                                      ___     ",
        "     /  /\\         /  /\\         /  /\\          ___            ___        /  /\\    ",
        "    /  /::|       /  /::\\       /  /::\\        /  /\\          /__/\\      /  /::|   ",
        "   /  /:|:|      /  /:/\\:\\     /  /:/\\:\\      /  /:/          \\__\\:\\    /  /:|:|   ",
        "  /  /:/|:|__   /  /:::\\ \\:\\   /  /:/  \\:\\    /  /:/           /  /::\\  /  /:/|:|__ ",
        " /__/:/ |:| /\\ /__/:/\\:\\ \\:\\ /__/:/ \\__\\:\\  /__/:/  ___    __/  /:/\\/ /__/:/_|::::\\",
        " \\__\\/  |:|/:/ \\  \\:\\ \\:\\_\\/ \\  \\:\\ /  /:/  |  |:| /  /\\  /__/\\/:/~~  \\__\\/  /~~/:/",
        "     |  |:/:/   \\  \\:\\ \\:\\    \\  \\:\\  /:/   |  |:|/  /:/  \\  \\::/           /  /:/ ",
        "     |__|::/     \\  \\:\\_\\/     \\  \\:\\/:/    |__|:|__/:/    \\  \\:\\          /  /:/  ",
        "     /__/:/       \\  \\:\\        \\  \\::/      \\__\\::::/      \\__\\/         /__/:/   ",
        "     \\__\\/         \\__\\/         \\__\\/           ~~~~                     \\__\\/    ", }

dashboard.section.buttons.val = {
        dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("Ctrl-f", "？ > Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("SPC ps", "⁋  > Find word", ":Telescope live_grep<CR>"),
        dashboard.button("Ctrl-e", "↗  > Harpooned files", ":Telescope live_grep<CR>"),
        dashboard.button("SPC n", "☰  > Open/Close File Tree", ":NvimTreeToggle<CR>"),
        dashboard.button("q", "⊗  > Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
