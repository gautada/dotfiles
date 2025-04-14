 return {
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
          width = 120,
          height = 35,
        },
        -- Open with a specific command
        open_mapping = [[<C-t>]],
        auto_scroll = true,  -- Auto scroll the terminal output
        start_in_insert = true,  -- Start terminal in insert mode
        insert_mappings = true,
        vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", { noremap = true, silent = true })
      }
      end
  },
}
