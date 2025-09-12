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
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting

    local function has_exec(bin)
      return vim.fn.executable(bin) == 1
    end

    null_ls.setup({
      sources = {
        -- Diagnostics (only add if executable is present)
        has_exec("hadolint")      and diagnostics.hadolint      or nil,
        -- has_exec("luacheck")      and diagnostics.luacheck      or nil,
        has_exec("markdownlint")  and diagnostics.markdownlint  or nil,
        -- has_exec("ruff")          and diagnostics.ruff          or nil,
        -- has_exec("shellharden")   and diagnostics.shellharden   or nil,
        has_exec("yamllint")      and diagnostics.yamllint      or nil,

        -- Formatting
        has_exec("markdownlint")  and formatting.markdownlint   or nil,
        has_exec("shellharden")   and formatting.shellharden    or nil,
        has_exec("shfmt")         and formatting.shfmt.with({
          extra_args = { "-i", "2" },
        }) or nil,
        has_exec("stylua")        and formatting.stylua         or nil,
        has_exec("yamlfmt")       and formatting.yamlfmt        or nil,
        -- has_exec("yamlfix")    and formatting.yamlfix        or nil, -- optional
      },
    })

    -- Keymap to format using LSP
    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format with LSP" })
  end,
}

