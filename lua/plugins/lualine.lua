return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = "tokyonight",
                disabled_filetypes = { statusline = { "neo-tree" }, winbar = {} }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        })
    end
}
