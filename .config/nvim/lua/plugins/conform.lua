return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rufo" },
      nix = { "alejandra" },
      typst = { "typstyle" },
    },
    format_on_save = {
      timeout_ms = 2000,
    },
  },
}
