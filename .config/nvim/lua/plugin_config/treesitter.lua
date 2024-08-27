local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
        return
end

-- configure treesitter
treesitter.setup({
        -- enable syntax highlighting
        highlight = {
                enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- ensure these language parsers are installed
        ensure_installed = {
                "rust",
                "json",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "c"
        },
        -- auto install above language parsers
        auto_install = true,
})
