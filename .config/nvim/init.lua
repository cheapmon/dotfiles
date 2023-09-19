-- Providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

-- Settings
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true

vim.opt.smartindent = true
vim.opt.backspace = "indent,eol,start"

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.hidden = true
vim.opt.updatetime = 50

vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.list = true

vim.opt.showmode = false
vim.opt.ruler = false
vim.opt.laststatus = 0
vim.opt.showcmd = false

vim.api.nvim_create_autocmd({ "BufReadPre", "FileReadPre" }, {
  callback = function()
    vim.opt.hidden = true
  end
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { underline = false }
)

-- Keymap
vim.g.mapleader = " "

vim.keymap.set("n", "<C-n>", vim.cmd.Ex)
vim.keymap.set("n", "<leader><Tab>", function() vim.cmd("b#") end)
vim.keymap.set("n", "<C-w>", function()
  if vim.api.nvim_buf_get_option(0, "filetype") == "netrw" then
    return
  end

  vim.cmd("Bdelete")
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>dh', vim.diagnostic.hide)
vim.keymap.set('n', '<leader>ds', vim.diagnostic.show)
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next)

-- Plugins
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
  "catppuccin/nvim",
  { "nvim-telescope/telescope.nvim", tag = "0.1.3", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "ThePrimeagen/harpoon", dependencies = { "nvim-lua/plenary.nvim" } },
  "mbbill/undotree",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "famiu/bufdelete.nvim",
  "m4xshen/autoclose.nvim",
  "ruby-formatter/rufo-vim"
})

-- Catppuccin
vim.cmd.colorscheme(os.getenv("VIM_COLORSCHEME"))
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", telescope.git_files)
vim.keymap.set("n", "<C-o>", telescope.find_files)
vim.keymap.set("n", "<C-f>", telescope.live_grep)
vim.keymap.set("n", "<C-b>", telescope.buffers)

-- Treesitter
local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = "all",
  auto_install = true,
  highlight = { enable = true }
})

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

vim.keymap.set("n", "<C-a>", harpoon_mark.toggle_file)
vim.keymap.set("n", "<M-h>", harpoon_ui.nav_prev)
vim.keymap.set("n", "<M-l>", harpoon_ui.nav_next)
vim.keymap.set("n", "<C-i>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<C-m>", function() vim.cmd("Telescope harpoon marks") end)

-- Undotree
vim.keymap.set("n", "<C-u>", vim.cmd.UndotreeToggle)

-- Bufdelete
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    if vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), '! empty(bufname(v:val)) && buflisted(v:val)')) == 1 then
      vim.cmd.Ex()
    end
  end
})

-- Autoclose
local autoclose = require("autoclose")

autoclose.setup()

-- Ruby
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start({
      name = "rubocop",
      cmd = { "rubocop", "--lsp" }
    })
  end
})

vim.g.rufo_auto_formatting = 1
