local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local telescope = require("telescope")

telescope.load_extension("harpoon")

vim.keymap.set("n", "<leader>ht", harpoon_mark.toggle_file)
vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev)
vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next)
vim.keymap.set("n", "<leader>hq", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hm", function() vim.cmd("Telescope harpoon marks") end)
