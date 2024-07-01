local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local terminal = require("harpoon.tmux")


vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)


vim.keymap.set("n", "<leader>1", function() ui.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>2", function() ui.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>3", function() ui.gotoTerminal(3) end)
vim.keymap.set("n", "<leader>4", function() ui.gotoTerminal(4) end)

vim.keymap.set("n", "<C-t>", function() terminal.nav_file(1) end)
vim.keymap.set("n", "<C-h>", function() terminal.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() terminal.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() terminal.nav_file(4) end)
