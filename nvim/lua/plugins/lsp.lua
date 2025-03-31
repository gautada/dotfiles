-- # Plug-in Spec: Language Server Protocol
--
-- ## Sub-Plugins:
-- - [Mason](https://github.com/williamboman/mason.nvim) is a portable package 
-- manager for Neovim that runs everywhere Neovim runs. Easily install and 
-- manage LSP servers, DAP servers, linters, and formatters. For help
-- `:help mason.vim`
-- - [Mason LSP Config](https://github.com/williamboman/mason-lspconfig.nvim) 
-- `mason-lspconfig` bridges `mason.nvim` with the `lspconfig` plugin making 
-- it easier to use both plugins together. For help 
-- `:help mason-lspconfig.nvim`
-- - [LSP Config](https://github.com/neovim/nvim-lspconfig) nvim-lspconfig is 
-- a "data only" repo, providing basic, default 
-- [Nvim LSP client](https://neovim.io/doc/user/lsp.html) configurations for 
-- various LSP servers. View the 
-- [documentation](https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file)
-- fpr all configs or `:help lspconfig-all` from Nvim.
--
-- ## Setup
--
-- Generally speaking, installing and setting up an LSP requires a three 
-- steps. First, install the supporting LSP application via
-- `brew install <lsp>`. Second, enable `auto_install` in `mason-lspconfig`.
-- Finally, invoke the `setup` method via `nvim-lspconfig`.
--
-- ## LSP List
--
-- These are the list of my target LSPs for my personal setup to provide status
-- and links to setup/config documentation.
--
-- [Language Servers](https://github.com/gautada/dotfiles/issues/5):
-- - html
-- - lua [lua_ls]()https://luals.github.io/#neovim-install
-- - 
-- - python
-- - YAML [yamlls](https://github.com/redhat-developer/yaml-language-server)
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { "lua_ls", "yamlls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- lspconfig.tsserver.setup({
      --   capabilities = capabilities
      -- })
      -- lspconfig.ts_ls.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.solargraph.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.html.setup({
      --   capabilities = capabilities,
      -- })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      -- lspconfig.pyright.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.ruff.setup({
      --   capabilities = capabilities,
      -- })
      -- lspconfig.markdownlint.setup({
      --   capabilities = capabilities,
      -- })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
      -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      -- vim.diagnostic.config({virtual_text = { current_line = true }})
      vim.diagnostic.config({virtual_lines = { current_line = true }})
    end,
  },
}
