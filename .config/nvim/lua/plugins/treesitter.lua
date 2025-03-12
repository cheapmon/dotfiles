return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = "all",
    auto_install = true,
    highlight = { enable = true },
  }
}
