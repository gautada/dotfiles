 -- File search -- Telescope keybindings
vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")

-- File tree -- Tree keybindings
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- vim.keymap.set("n", "<leader>t", ":NvimTreeFindFileToggle<cr>")
-- You can map other keys for toggling terminal
vim.keymap.set("n", "<C>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

-- Markdown -- MdPreview keybindings
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<cr>")

-- Comments -- Comment keybindings
vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")
