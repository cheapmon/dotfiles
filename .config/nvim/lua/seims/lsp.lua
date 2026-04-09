vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.lsp.enable({
  "bashls",
  "jsonls",
  "lua_ls",
  "ruby-lsp",
  "taplo",
  "tinymist",
  "ts_ls",
})
