return {
    {
        "rust-lang/rust.vim",
    },
    {
        "mrcjkb/rustaceanvim",
        version = '^6',
        lazy = false,

        config = function ()
            vim.g.rustaceanvim = {
                tools = {
                    hover_actions = {
                        replace_builtin_hover = false
                    }
                }
            }
        end
    },
}
