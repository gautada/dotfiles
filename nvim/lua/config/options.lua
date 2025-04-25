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
-- vim.opt.cursorline = true -- Enable cursorline highlighing
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to clipboard

-- vim.cmd([[ 
--       let &t_SI = "\e[1 q"  -- Bold block cursor
--       let &t_EI = "\e[0 q"  -- Restore cursor shape
--   ]])

-- Set cursor style for different modes using guicursor
-- vim.opt.guicursor = {
--   "n-v-c-sm:block",       -- Normal, Visual, Command-line, and Select modes: block cursor
--   "i-ci-ve:ver75",        -- Insert and Command-line insert mode: vertical bar of width 25%
--   "r-cr-o:hor20",         -- Replace, Command-line replace, and Operator-pending mode: horizontal underline of height 20%
--   "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- All modes with blinking
--   "sm:block-blinkwait175-blinkoff150-blinkon175"  -- Select mode: block cursor with blinking
-- }

vim.opt.guicursor = {
  "n-v-c-sm:block-blinkon0",       -- Normal, Visual, Command-line, and Select modes: block cursor without blinking
  "i-ci-ve:block-blinkwait700-blinkoff400-blinkon250", -- Insert and Command-line insert mode: blinking block cursor
  "r-cr-o:hor20-blinkon0",         -- Replace, Command-line replace, and Operator-pending mode: horizontal underline cursor without blinking
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",  -- All modes with blinking support
  "sm:block-blinkwait175-blinkoff150-blinkon175"  -- Select mode: blinking block cursor
}

-- (Optional) Enable cursor line only in insert mode
vim.cmd [[
  augroup CursorLine
    autocmd!
    autocmd InsertEnter * set cursorline
    autocmd InsertLeave * set nocursorline
  augroup END
]]

-- Customize CursorLine color
-- vim.cmd [[
--   augroup CustomCursorLine
--     autocmd!
--     autocmd ColorScheme * highlight CursorLine guibg=#cccccc cterm=NONE ctermbg=238
--   augroup END
-- ]]

-- Set the color scheme
-- vim.cmd([[colorscheme catppuccin]])
-- highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE guibg=LightYellow
-- 
-- (Optional) Customize cursor line and iCursor highlight groups
vim.cmd [[
  highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE guibg=#181926
  highlight iCursor guifg=NONE guibg=Yellow
]]


-- -- (Optional) Customize cursor line and iCursor highlight groups
-- vim.cmd [[
--   highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE guibg=LightYellow
--   highlight iCursor guifg=NONE guibg=Grey
-- ]]
--
-- -- (Optional) Load colorscheme after customizing highlights
-- vim.cmd [[
--   colorscheme desert
-- ]]


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
