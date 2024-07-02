local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local terminal = require("harpoon.tmux")


vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)


vim.keymap.set("n", "<leader>1", function() terminal.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>2", function() terminal.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>3", function() terminal.gotoTerminal(3) end)
vim.keymap.set("n", "<leader>4", function() terminal.gotoTerminal(4) end)

vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
