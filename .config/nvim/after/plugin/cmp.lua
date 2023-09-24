local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item()
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" }
  }
})
