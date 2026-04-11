-- Plugin Spec: Project Management
-- Adds project root detection + Telescope integration via project.nvim
return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local ok, project = pcall(require, "project_nvim")
      if not ok then
        return
      end

      project.setup({
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
      })

      vim.keymap.set("n", "<leader>fp", function()
        local telescope_ok, telescope = pcall(require, "telescope")
        if not telescope_ok then
          return
        end
        telescope.extensions.projects.projects({})
      end, { desc = "Find project" })
    end,
  },
}
