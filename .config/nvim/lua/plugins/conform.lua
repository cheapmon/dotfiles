return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rufo" },
      nix = { "alejandra" },
    },
    formatters = {
      rufo = {
        command = "nix-shell",
        args = { vim.fn.expand("~/.config/nix/shells/ruby.nix"), "--run", "rufo $FILENAME" }
      },
    },
    format_on_save = {
      timeout_ms = 2000,
    },
  },
}
