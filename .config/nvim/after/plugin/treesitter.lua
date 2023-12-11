local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = "all",
  auto_install = true,
  highlight = { enable = true }
})
