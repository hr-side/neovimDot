vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")
vim.opt.fillchars:append({ eob = " " })

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.clipboard = "unnamedplus"
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

-- moving lines shortcuts:

vim.keymap.set("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
vim.keymap.set("i", "<c-j>", "<Esc><cmd>m .+1<CR>==gi", { silent = true })
vim.keymap.set("i", "<c-k>", "<Esc><cmd>m .-2<CR>==gi", { silent = true })
vim.keymap.set("v", "<c-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<c-k>", ":m '<-2<CR>gv=gv", { silent = true })


-- Powershell opt

local powershell_options = {
  shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoProfile -NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command ",
  shellxquote = "",
  shellquote = "",
  shellpipe = "| Out-File -Encoding UTF8 ",
  shellredir = "2>&1 | Out-File -Encoding UTF8 ",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end
