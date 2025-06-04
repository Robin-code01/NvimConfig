vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true

-- For Telescope Search:
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.find_files, {})

-- For Neo Tree
vim.keymap.set("n", "<C-n>", ":Neotree reveal left<CR>")
