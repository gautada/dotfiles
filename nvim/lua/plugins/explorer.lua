-- Plugin Spec: [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		-- vim.keymap.set("n", "<leader>e", ":Neotree buffers reveal float<CR>", {})	
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal float<CR>", {})
  end,
}
