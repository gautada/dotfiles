-- # Plug-in Spec: Search
--
-- ## Sub-Plug-ins
-- - [Telescope](https://github.com/nvim-telescope/telescope.nvim)
-- - [Telescope-UI-Select](https://github.com/nvim-telescope/telescope-ui-select.nvim)
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>f", builtin.find_files, {})
			vim.keymap.set("n", "<leader>g", builtin.live_grep, {})
			-- *** NOT SURE WHAT THESE KEYMAPS ARE ***
			-- vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
			-- vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
