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
  { "catppuccin/nvim",
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
    end,
  },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  { "neovim/nvim-lspconfig", dependencies = { "hrsh7th/cmp-nvim-lsp" } },
  { "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-vsnip", "hrsh7th/vim-vsnip" } },
  { "nvim-pack/nvim-spectre" },
  { "christoomey/vim-tmux-navigator" },
  { "tpope/vim-fugitive" },
  { "tpope/vim-commentary" },
  { "ruby-formatter/rufo-vim" },
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup({ replace_netrw = true })

      vim.keymap.set("n", "<leader>n", function() require("ranger-nvim").open(true) end)
    end
  }
})
