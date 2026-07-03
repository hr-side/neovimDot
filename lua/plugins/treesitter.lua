return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = "master",
    build = ':TSUpdate',
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
                "java",
                "c"
            },
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
