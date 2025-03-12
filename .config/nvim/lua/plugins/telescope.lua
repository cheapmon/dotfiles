return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    opts = {
      defaults = {
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      }
    },
    keys = {
      { "<C-p>", function() require("telescope.builtin").find_files() end },
      { "<leader>tl", function() require("telescope.builtin").live_grep() end },
      { "<leader>tb", function() require("telescope.builtin").buffers() end },
      { "<leader>th", function() require("telescope.builtin").help_tags() end },
      { "<leader>ts", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end  },
      { "<leader>td", function() require("telescope.builtin").lsp_document_symbols() end },
      { "<leader>tr", function() require("telescope.builtin").resume() end },
      { "<leader>to", function() require("telescope.builtin").oldfiles() end },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  },
}
