return {
  "hrsh7th/nvim-cmp",
  name = "cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip"
  },
  opts = function()
    local cmp = require("cmp")

    return {
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item()
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "vsnip" }
      }
    }
  end,
}
