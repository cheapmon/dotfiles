local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-r>"] = "to_fuzzy_refine",
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case"
      }
    }
  }
})

telescope.load_extension("fzf")

vim.keymap.set("n", "<C-p>", telescope_builtin.find_files)
vim.keymap.set('n', '<leader>tf', function() telescope_builtin.find_files({ cwd = vim.fn.expand('%:p:h') }) end)
vim.keymap.set("n", "<leader>tl", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>tb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>th", telescope_builtin.help_tags)
vim.keymap.set("n", "<leader>ts", telescope_builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set("n", "<leader>td", telescope_builtin.lsp_document_symbols)
vim.keymap.set("n", "<leader>tr", telescope_builtin.resume)
vim.keymap.set("n", "<leader>to", telescope_builtin.oldfiles)
