vim.g.loaded_newtrw = 1
vim.g.loaded_newtrwPlugin = 1

require("nvim-tree").setup({
        on_attach = "default",
        hijack_netrw = true,
        renderer = {
                special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                add_trailing = false,
                group_empty = false,
                full_name = false,
                highlight_opened_files = "none",
                indent_width = 2,
                indent_markers = {
                        enable = false,
                        inline_arrows = true,
                        icons = {
                                corner = "└",
                                edge = "│",
                                item = "│",
                                bottom = "─",
                                none = " ",
                        },
                },
                icons = {
                        padding = " ",
                        git_placement = "before",
                        symlink_arrow = "",
                        glyphs = {
                                default = "",
                                symlink = "",
                                bookmark = "",
                                modified = "",
                                folder = {
                                        arrow_closed = "",
                                        arrow_open = "",
                                        default = "",
                                        empty = "",
                                        empty_open = "",
                                        symlink = "",
                                        symlink_open = "",
                                },
                                git = {
                                        unstaged = "",
                                        staged = "",
                                        unmerged = "",
                                        renamed = "󰃉",
                                        untracked = "",
                                        deleted = "",
                                        ignored = ""
                                },
                        },
                },
        },
})

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>nn", ":NvimTreeFindFile<CR>")
