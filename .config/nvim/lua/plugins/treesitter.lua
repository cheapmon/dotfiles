return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "bash", "css", "html", "javascript", "json", "kdl", "lua", "markdown",
      "markdown_inline", "nix", "query", "ruby", "toml", "tsx", "typescript",
      "typst", "vim", "vimdoc", "yaml",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        -- Fails quietly for filetypes without a parser
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
