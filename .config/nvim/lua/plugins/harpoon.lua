return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ha", function() require("harpoon"):list():add() end },
    { "<leader><Space>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
    { "<M-h>", function() require("harpoon"):list():prev() end },
    { "<M-l>", function() require("harpoon"):list():next() end },
    {
      "<leader>hm",
      function()
        local conf = require("telescope.config").values

        local file_paths = {}
        for _, item in ipairs(require("harpoon"):list().items) do
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
    },
  },
}
