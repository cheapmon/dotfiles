local lsp_zero = require("lsp-zero")

lsp_zero.setup_servers({
  "solargraph",
  "rubocop",
  "lua_ls",
  "rust_analyzer",
  "bashls",
  "ts_ls",
  "jsonls",
  "eslint",
  "texlab",
})

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
