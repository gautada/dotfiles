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
  -- ### Notes
  --
  -- - [Medium Article](https://medium.com/@shaikzahid0713/alpha-start-up-screen-8e4a6e95804d)
  --
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      -- local dashboard = require("alpha.themes.startify")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
      [[                                                   ]],
      [[                                              ___  ]],
      [[                                           ,o88888 ]],
      [[                                        ,o8888888' ]],
      [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
      [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
      [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
      [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
      [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
      [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
      [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
      [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
      [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
      [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
      [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
      [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
      [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
      [[     ...:.'.:.::::"'    . . . . .'                 ]],
      [[    .. . ....:."' `   .  . . ''                    ]],
      [[  . . . ...."'                                     ]],
      [[  .. . ."'                                         ]],
      [[ .                                                 ]],
      [[                                                   ]],
      }
      dashboard.section.buttons.val = {
        dashboard.button("o", "  Open File", ":Neotree filesystem reveal float <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " Recently used files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", "󰱽 Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
        dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
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
        char = "░", -- Character used for the column marker
        -- The unicode characters for column to insert ctrl-v u2588
        -- **U+2588**: Full Block
        -- **U+2591**: Light Shade
        -- **U+2592**: Medium Shade
        -- **U+2593**: Dark Shade
        virtcolumn = "80", -- Highlight the 80th column
      })
    end,
    vim.keymap.set("n", "<leader>a", ":Alpha<cr>") -- Cycle forward through buffers

  }
}
