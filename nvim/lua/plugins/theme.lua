-- Plugin Spec: theme
-- Theme: [catppuccin](https://github.com/catppuccin/catppuccin)
return {
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
}
