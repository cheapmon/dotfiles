local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.3", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" } },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-buffer" } },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  { "mbbill/undotree" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },
  { "m4xshen/autoclose.nvim" },
  { "ruby-formatter/rufo-vim" }
})