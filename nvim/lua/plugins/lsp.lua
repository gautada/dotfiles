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
-- - [bashls](https://github.com/bash-lsp/bash-language-server)
--   - `brew install bash-language-server`
-- - [dockerls](https://github.com/rcjsuen/dockerfile-language-server)
--   - `brew install dockerfile-language-server`
-- - [lua_ls](https://github.com/LuaLS/lua-language-server)
--   - `brew install lua-
-- - [pyright](https://github.com/microsoft/pyright)
--   - `brew install pyright`
-- - [ruff](https://github.com/astral-sh/ruff/)
--   - `brew install ruff`
-- - [yamlls](https://github.com/redhat-developer/yaml-language-server)
--   - `brew install yaml-language-server`
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
      ensure_installed = { "bashls", "dockerls", "lua_ls", "ruff", "yamlls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- old: tsserver to ts_ls.setup
      -- remove: solargraph
      -- install and configure: html??, markdownlint
      -- python: **ruff
      lspconfig.bashls.setup({
        capabilities = capabilities,
        filetypes = { "sh", "zsh" }, -- Enable for shell and zsh scripts
      })

      lspconfig.dockerls.setup({
        capabilities = capabilities,
        filetypes = { "dockerfile", "Containerfile", "Dockerfile" },
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ruff.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
        settings = {
          yaml = {
            -- schemas = {
            -- 	kubernetes = "/*.yaml",
            -- 	["https://json.schemastore.org/github-action.json"] = "/.github/workflows/*",
            -- },
            validate = true,
            format = { enable = true },
            hover = true,
          },
        },
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {})
      -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      -- vim.diagnostic.config({virtual_text = { current_line = true }})
      vim.diagnostic.config({ virtual_lines = { current_line = true } })
    end,
  },
}
