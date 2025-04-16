return {
  "echasnovski/mini.files",
  version = false,
  opts = {
    options = {
      use_as_default_explorer = false
    },
    windows = {
      preview = true,
      width_preview = 80,
    },
  },
  keys = {
    {
      "<leader>m",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
    },
  },
}
