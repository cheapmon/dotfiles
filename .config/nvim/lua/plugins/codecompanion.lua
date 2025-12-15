return {
  "olimorris/codecompanion.nvim",
  version = "^18.0.0",
  opts = {
    interactions = {
      chat = {
        adapter = "claude_code"
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
