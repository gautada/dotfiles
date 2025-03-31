return {
  -- Visualize buffers as tabs
  -- [bufferline](https://github.com/akinsho/bufferline.nvim)
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
}
