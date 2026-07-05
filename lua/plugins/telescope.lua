return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
          dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            local actions = require('telescope.actions')
            local actionS = require('telescope.actions.state')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
            require('telescope').setup({
                pickers = {
                    git_status = {
                        mappings = {
                            i = {
                                ["<C-r>"] = function(prompt_bufnr)
                                    local selection = actionS.get_selected_entry()
                                    vim.fn.system("git checkout -- " .. selection.value)
                                    actions.close(prompt_bufnr)
                                    builtin.git_status()
                                end,
                            },
                        },
                    },
                },
            })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
