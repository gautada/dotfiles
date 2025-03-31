-- Plugin Spec: theme
-- Theme: [catppuccin](https://github.com/catppuccin/catppuccin)
return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato"
    end
  }
}

