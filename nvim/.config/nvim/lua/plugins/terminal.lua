-- Plugin Spec: Terminal
--
-- Provides a floating pop-up terminal inside Neovim.
--
-- ## Plug-In
--
-- - [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
--
-- ## Keybindings
--
-- | Mode         | Keys    | Action                        |
-- | ------------ | ------- | ----------------------------- |
-- | Normal       | <C-t>   | Toggle the floating terminal  |
-- | Terminal     | <C-t>   | Toggle (close) the terminal   |
--
-- ## Configuration Notes
--
-- - Shell: zsh (`/bin/zsh`)
-- - Direction: float (120×35)
-- - Auto-scroll: enabled
-- - Starts in insert mode when opened

return {
   { 
    "akinsho/toggleterm.nvim",
    version = "v2.*",  -- Optionally specify a version
    config = function()
      require("toggleterm").setup{
        size = 20,
        direction = 'float',
        shell = "/bin/zsh", -- Launches zsh, sources your rc, then starts a login shell
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
