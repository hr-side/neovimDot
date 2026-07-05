return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
          "williamboman/mason.nvim",
          "williamboman/mason-lspconfig.nvim",
          "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
          require("mason").setup()
          require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "pyright", "clangd" },
            automatic_installation = true,
          })

          local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config("lua_ls", { capabilities = capabilities })
        vim.lsp.config("pyright", { capabilities = capabilities })
        vim.lsp.config("clangd", { capabilities = capabilities })

          vim.lsp.enable("lua_ls")
          vim.lsp.enable("pyright")
          vim.lsp.enable("clangd")

          vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
              local opts = { buffer = ev.buf }
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
              vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            end,
          })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "L3MON4D3/LuaSnip",
          "saadparwaiz1/cmp_luasnip",
        },
        config = function()
          local cmp = require("cmp")
          local luasnip = require("luasnip")

          cmp.setup({
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            })
          })
        end
    }
}
