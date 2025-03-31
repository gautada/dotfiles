return {
  {
    "lukas-reineke/virt-column.nvim",
    event = "BufRead", -- Loads when a file is opened
    config = function()
      require("virt-column").setup({
        char = "│", -- Character used for the column marker
        virtcolumn = "80", -- Highlight the 80th column
      })
    end,
  }
}
