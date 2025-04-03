-- # Plug-In Spec: Actions
--
-- This is a list of plugins that provide action in the editor for the user.
--
return {


  -- ## Treesitter
  --
  -- This is used by multiple plugins to parse structured files like 
  -- source-code.
  --
  -- ### Plug-In:
  --
  -- - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  --
  -- ### Notes:
  --
  -- - To test that treesitter is installed `:TSModuleInfo`
  --
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },


  -- ## Comment
  -- 
  -- A comment toggle that works across multiple languages
  --
  -- ### Plug-Ins:
  --
  -- - [comment](https://github.com/terrortylor/nvim-comment)
  {
    "terrortylor/nvim-comment",
    config = function()
	     require("nvim_comment").setup({ create_mappings = false })
       vim.keymap.set({"n", "v"}, "<leader>/", ":CommentToggle<cr>")
    end
  },
}
