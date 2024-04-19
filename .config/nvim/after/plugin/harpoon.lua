local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader><Space>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<M-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-l>", function() harpoon:list():next() end)

local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<leader>hm", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
