return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
    {
      "<leader>zz",
      "<cmd>Trouble diagnostics toggle pinned=true win.relative=win win.position=bottom win.size=0.3 win.wrap=true auto_close=true auto_open=false filter.buf=0<cr>",
      desc = "Diagnostics (Trouble)",
    }
    },
}
