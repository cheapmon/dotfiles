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
vim.opt.grepprg="rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat="%f:%l:%c:%m"

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
