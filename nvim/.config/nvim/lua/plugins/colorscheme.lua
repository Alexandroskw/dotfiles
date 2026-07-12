return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
        require("nightfox").setup({
            options = {
                styles = {}
            }
        })
        vim.cmd("colorscheme duskfox")
    end
}
