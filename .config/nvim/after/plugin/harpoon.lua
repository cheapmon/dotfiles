local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local telescope = require("telescope")

telescope.load_extension("harpoon")

vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file)
vim.keymap.set("n", "<M-h>", harpoon_ui.nav_prev)
vim.keymap.set("n", "<M-l>", harpoon_ui.nav_next)
vim.keymap.set("n", "<leader><Space>", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hm", function() vim.cmd("Telescope harpoon marks") end)
