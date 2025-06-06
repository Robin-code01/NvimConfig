vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
require("config.lazy")
vim.opt.number = true
vim.opt.relativenumber = true


-- Yank into system clipboard with <leader>y in normal mode:
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })

-- Yank in visual mode into system clipboard:
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- To select all using ctrl+a:
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('v', '<C-a>', 'ggVG', { noremap = true, silent = true })
vim.keymap.set('i', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- To delete an entore word when i do Ctrl+Backspace
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.keymap.set("c", "<C-BS>", "<C-W>", { noremap = true, silent = true })
