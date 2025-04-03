-- # Plug-in Spec: Style
--
-- This is all of the style based plugin and configuration.  Each sub-section
-- will provide a summary and documentation of it's specifci purpose. This is 
-- different than `actions.lua` which holds command/actions that a user will
-- employ.
--
return {

  -- ## Welcome
  --
  -- This is a welcome dashboard whenever you open neovim without specifying a
  -- specific file.
  --
  -- ### Plug-ins
  --
  -- - [alhpa](https://github.com/goolord/alpha-nvim)
  --
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },

  -- ## Status
  --
  -- Provides the status of the current environment.  This should be considered
  -- with the **starship** CLI configuration when making changes.
  --
  -- ### Plug-ins:
  --
  -- - [lualine](https://github.com/nvim-lualine/lualine.nvim)
  --
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,                                                      -- Load at startup
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" }, -- Optional for icons
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "catppuccin",
          theme = "catppuccin",
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } }, -- Shows full file path
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },


  -- # Tabs
  --
  -- Visualize buffers as tabs
  --
  -- ## Plug-ins:
  --
  -- - [bufferline](https://github.com/akinsho/bufferline.nvim)
  --
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({})
      vim.opt.termguicolors = true -- bufferline
      vim.keymap.set("n", "<leader><Tab>", ":bn<cr>") -- Cycle forward through buffers
      vim.keymap.set("n", "<leader><S-Tab>", ":bp<cr>") -- Cycle back through buffers
      vim.keymap.set("n", "<leader>w", ":bd<cr>") -- Close the current buffer
    end,
  },


  -- # Theme
  --
  -- Set the colorshceme to use for the editor.
  -- 
  -- Plug-Ins:
  -- 
  -- - [catppuccin](https://github.com/catppuccin/catppuccin)
  --
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato", -- Choose: latte, frappe, macchiato, mocha
				-- integrations = {
				-- 	lualine = true, -- Enable Lualine integration
				-- },
			})
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
  },

  -- # Columns
  --
  -- Provides a line at the 80th character.
  --
  -- ## Plug-Ins:
  --
  -- - [Column](https://github.com/lukas-reineke/virt-column.nvim)
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufRead", -- Loads when a file is opened
    config = function()
      require("virt-column").setup({
        char = "│", -- Character used for the column marker
        virtcolumn = "80", -- Highlight the 80th column
      })
    end,
  }
}
