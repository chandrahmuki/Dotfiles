require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- better beg and end of line
map({ "n", "v" }, "<leader>h", "0", { desc = "Start of line" })
map({ "n", "v" }, "<leader>l", "$", { desc = "End of line" })

---closing all
map("n", "<leader>Q", ":qa<CR>", { desc = "Quit all (ask to save if needed)" })
