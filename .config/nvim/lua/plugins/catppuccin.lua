return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      transparent_background = true,
      integrations = {
        cmp = true,
        flash = true,
        harpoon = true,
        telescope = true,
        treesitter = true,
      }
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
