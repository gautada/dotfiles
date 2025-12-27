-- # Neovim Setup
--
-- Simple setup with lazy package manager and modular setup
--
-- ## Configure
--
-- ### Options
--
-- Vim tooling options not havingto do with specifific plugins.
--
-- Alpine: ensure system-wide plugins are visible (Alpine packages live here)
vim.opt.packpath:prepend("/usr/share/nvim/site")
vim.opt.runtimepath:prepend("/usr/share/nvim/site")

-- ### lazy
--
-- Setup the Lava.nvim package manager.
require("config.options")
require("config.lazy")


