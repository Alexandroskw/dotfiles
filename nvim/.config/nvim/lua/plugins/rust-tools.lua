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
                }
            }
        end
    },
}
