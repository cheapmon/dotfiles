vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- bashls
vim.lsp.config("bashls", {
  cmd = { "bash-language-server", "start" },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
    },
  },
  filetypes = { "bash", "sh" },
  root_markers = { ".git" },
})
vim.lsp.enable("bashls")

-- jsonls
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { ".git" },
})
vim.lsp.enable("jsonls")

-- lua_ls
vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".emmyrc.json",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = "Disable" },
    },
  },
})
vim.lsp.enable("lua_ls")

-- rubocop
vim.lsp.config("rubocop", {
  cmd = { "rubocop --lsp" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
})
vim.lsp.enable("rubocop")

-- solargraph
vim.lsp.config("solargraph", {
  cmd = { "solargraph stdio" },
  settings = {
    solargraph = {
      diagnostics = true,
    },
  },
  init_options = { formatting = true },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
})
vim.lsp.enable("solargraph")

-- tinymist
vim.lsp.config("tinymist", {
  cmd = { "tinymist" },
  filetypes = { "typst" },
  root_markers = { ".git" },
})
vim.lsp.enable("tinymist")

-- ts_ls
vim.lsp.config("ts_ls", {
  init_options = { hostInfo = "neovim" },
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
})
vim.lsp.enable("ts_ls")
