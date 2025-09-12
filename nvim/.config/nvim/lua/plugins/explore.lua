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
				-- follow_current_file = true, -- Keep Neo-tree in sync with the open file
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw = true, -- Replace netrw with Neo-tree
				use_libuv_file_watcher = true, -- Auto-update when files change
				bind_to_cwd = false, -- Allow independent navigation
				cwd_target = {
					sidebar = "global", -- Global navigation, not limited to PWD
					current = "global",
				},
				filtered_items = {
					visible = true, -- Show hidden files (dotfiles)
					hide_dotfiles = false, -- Don't hide files starting with `.`
					hide_gitignored = false, -- Optionally show .gitignored files
				},
				window = {
					mappings = {
						["h"] = "navigate_up", -- Press `h` to go up a directory (`..`)
						-- ["l"] = "open", -- Press `l` to open a file/directory
						-- ["<cr>"] = "open_and_close", -- Pressing Enter will open and close Neo-tree
					},
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
		-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>exp", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<leader>exf", ":Neotree filesystem reveal float<CR>", {})
		vim.keymap.set("n", "<leader>exs", ":Neotree filesystem reveal left<CR>", {})
	end,
}
