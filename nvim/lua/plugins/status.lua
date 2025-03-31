return {
	{
		"nvim-lualine/lualine.nvim",
		lazy = false, -- Load at startup
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
}
