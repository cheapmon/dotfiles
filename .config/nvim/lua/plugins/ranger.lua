return {
  "kelly-lin/ranger.nvim",
  name = "ranger-nvim",
  opts = {},
  keys = {
    { "<leader>r", function() require("ranger-nvim").open(true) end }
  },
}
