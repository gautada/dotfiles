-- Install [lazy.nvim](https://lazy.folke.io) via the
-- [github repo](https://github.com/folke/lazy.nvim)
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Example lazy.nvim setup
require("lazy").setup({
  -- Theme Plugin: [catppuccin](https://github.com/catppuccin/catppuccin)
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
  { "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - A file explorer
  -- written in lua.
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    requires = {
	"nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true, -- Close nvim-tree after opening a file
          },
        },
      })
    end,
  },

  { 
    "akinsho/toggleterm.nvim",
    version = "v2.*",  -- Optionally specify a version
    config = function()
      require("toggleterm").setup{
        size = 20,
        direction = 'float',
        -- shell = '/bin/zsh -l -c ". ~/.zshrc"',
	float_opts = {
          border = 'single',
          width = 140,
          height = 40,
        },
        -- Open with a specific command
        open_mapping = [[<c-\>]],
        auto_scroll = true,  -- Auto scroll the terminal output
        start_in_insert = true,  -- Start terminal in insert mode
        insert_mappings = true,
      }
      end
  },


  -- Visualize buffers as tabs
  -- [bufferline](https://github.com/akinsho/bufferline.nvim)
  {"akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons"},

  -- Markdown preview, @to-do: Need to open in safari not chrome
  -- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)


  --Commentor
  {
    "terrortylor/nvim-comment",
    config = function()
	require("nvim_comment").setup({ create_mappings = false })
    end
  },

  -- LSP Zero
  -- https://github.com/VonHeikemen/lsp-zero.nvim
  -- doc / md / guides / lazy-loading-with-lazy-nvim.md
})
-- Setup lazy.nvim
-- require("lazy").setup({
--   spec = {
--     -- import your plugins
--     { import = "plugins" },
--   },
--   -- Configure any other settings here. See the documentation for more details.
--   -- colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
--   -- automatically check for plugin updates
--   checker = { enabled = true },
-- })
