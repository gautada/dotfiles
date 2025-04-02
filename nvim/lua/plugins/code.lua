-- # Plug-in Spec: Code
--
-- This is a plug-in module specifically for plug-in designed for coding such
-- as linters and formaters.
--
-- ## Sub-Plug-ins
--
-- Usually these are external CLI tools that need to be installed.  If the
-- tooling should be installed via Homebrew on a macOS system then it will be
-- marked as `*`.  Otherwise guidance on how-to install will be provided below.
--
-- [Mason Packages](https://mason-registry.dev/registry/list)
-- ### Installation
--
-- The general installation steps are:
-- - Install CLI command via `brew install <package>`.  Make sure this is added
-- to the stanfdard brew packages list for development.
-- - Install via mason: either manually via `:Mason` or using the
-- `mason-lspconfig` plug-in `ensure_installed`.  The makes sure the nvim
-- client is available.
-- -- Configure the `null_ls` setup configuration below.
--
-- ### Linters
--
-- - [hadolint](https://github.com/hadolint/hadolint)
--   - `brew install hadolint`
-- - [luacheck](https://github.com/lunarmodules/luacheck)
--   - `brew install luacheck`
-- - [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
--   - * `brew install markdownlint-cli`
-- - **ruff**
-- - [shellharden]( https://github.com/koalaman/shellharden)
--   - * `brew install shellharden`
-- - [yamllint](https://github.com/adrienverge/yamllint)
--   - `brew install yamllint`
--
-- ### Formatting
--
-- - Dockerfile?
-- - **markdownlint**
-- - **ruff**
-- - **shellharden**
-- - [stylua](https://github.com/JohnnyMorganz/StyLua)
--   - * `brew install sylua`
-- - [yamlfix](https://github.com/lyz-code/yamlfix)
--   - `brew install yamlfix`
-- - [yamlfmt](https://github.com/google/yamlfmt)
--   - `brew install yamlfmt`
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.luacheck,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.diagnostics.shellharden,
        null_ls.builtins.diagnostics.yamllint,

        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.shellharden,
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2" }, -- Set indentation to 2 spaces
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.yamlfmt,
        -- null_ls.builtins.formatting.yamlfix,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
