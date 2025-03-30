-- Set the 'space bar' as leader key
vim.g.mapleader = " "


-- vim.keymap.set("n", "<leader>n", ":bn<cr>")
-- vim.keymap.set("n", "<leader>p", ":bp<cr>")
vim.keymap.set("n", "<leader><Tab>", ":bn<cr>")
vim.keymap.set("n", "<leader><S-Tab>", ":bp<cr>")
vim.keymap.set("n", "<leader>w", ":bd<cr>")

-- leaderW to move around panes
--

-- Yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

