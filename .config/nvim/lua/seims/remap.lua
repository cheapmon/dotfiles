vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
vim.keymap.set("n", "<leader>x", vim.cmd.bd)
vim.keymap.set("n", "<leader><Tab>", function() vim.cmd("b#") end)

vim.keymap.set("n", "<M-.>", vim.cmd.bn)
vim.keymap.set("n", "<M-,>", vim.cmd.bp)
vim.keymap.set("n", "<leader>bd", function() vim.cmd("bufdo bd!") end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>dh", vim.diagnostic.hide)
vim.keymap.set("n", "<leader>ds", vim.diagnostic.show)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>-", vim.cmd.sp)
vim.keymap.set("n", "<leader>|", vim.cmd.vsp)

vim.keymap.set("n", "<M-j>", "5<C-w><")
vim.keymap.set("n", "<M-k>", "5<C-w>>")
