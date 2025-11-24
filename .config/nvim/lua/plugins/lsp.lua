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
        "lua_ls",
        "rust_analyzer",
        "bashls",
        "ts_ls",
        "jsonls",
        "eslint",
        "texlab",
        "tinymist",
      })

      -- Configure Ruby LSPs to run through nix-shell
      local lspconfig = require("lspconfig")
      local nix_shell_path = vim.fn.expand("~/.config/nix/shells/ruby.nix")

      lspconfig.solargraph.setup({
        cmd = { "nix-shell", nix_shell_path, "--run", "solargraph stdio" },
      })

      lspconfig.rubocop.setup({
        cmd = { "nix-shell", nix_shell_path, "--run", "rubocop --lsp" },
      })

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
    end
  },
}
