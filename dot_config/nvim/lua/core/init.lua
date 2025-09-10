-- ~/.config/nvim/lua/core/init.lua
require("core.options")

vim.g.mapleader = " "

-- basic keymaps
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })

