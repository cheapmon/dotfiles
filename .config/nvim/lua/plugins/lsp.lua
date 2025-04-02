return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

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
        "tinymist",
      })

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
    end
  },
}
