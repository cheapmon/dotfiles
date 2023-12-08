local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = "all",
  auto_install = true,
  highlight = { enable = true }
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("autocmd BufReadPost,FileReadPost * normal zR")
