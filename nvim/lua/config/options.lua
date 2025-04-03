-- VIM Options that are not specific to a plugin
-- [NeoVIM IDE 2024](https://github.com/zazencodes/zazencodes-season-1/blob/main/src/neovim-lazy-ide-2024/.config/nvim/lua/options.lua).
vim.g.mapleader = " " -- Set the leader to <Space>
vim.opt.encoding = "utf-8" -- set encoding
vim.opt.nu = true -- enable line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.tabstop = 2 -- A tab character is visually represented as 2 spaces.
vim.opt.softtabstop = 2 -- When pressing backspace, remove up to 2 spaces at a time.
vim.opt.shiftwidth = 2 -- When auto-indenting, use 2 spaces per indentation level.
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.autoindent = true -- auto indentation
vim.opt.list = true -- show tab characters and trailing whitespace
vim.opt.backup = false -- Disable backup files
vim.opt.writebackup = false -- Prevent writing a backup file before overwriting
vim.opt.swapfile = false -- Disable swap file creation.
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to clipboard

-- [VIM for newbs](https://github.com/cpow/neovim-for-newbs/blob/main/lua/vim-options.lua)
-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
-- clears last search
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')i
-- Enable line numbers in current window
-- vim.wo.number = true
-- NOTES:
-- leaderW to move around panes
