-- Plugin Spec: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
-- Need to be able to toggle . file
-- Need to be able to go above current folder -- or bring back nvim-tree
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files (dotfiles)
					hide_dotfiles = false, -- Don't hide files starting with `.`
					hide_gitignored = false, -- Optionally show .gitignored files
				},
			},
		})
		-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		-- vim.keymap.set("n", "<leader>e", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal float<CR>", {})
	end,
}
