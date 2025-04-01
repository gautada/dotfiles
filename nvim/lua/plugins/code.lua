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
-- ### Formatting
--
-- - **markdownlint**
-- - [shfmt](https://github.com/mvdan/sh)
--   - * `brew install shfmt`
-- - [stylua](https://github.com/JohnnyMorganz/StyLua)
--   - * `brew install sylua`
--
-- ### Linters
--
-- - [luacheck](https://github.com/lunarmodules/luacheck) 
-- - [markdownlint](https://github.com/igorshubovych/markdownlint-cli)
--   - * `brew install markdownlint-cli`
-- - [shellcheck](https://www.shellcheck.net/)
--   - * `brew install shellcheck`
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.markdownlint,
				-- sh&zsh
				null_ls.builtins.diagnostics.shellcheck,
				null_ls.builtins.formatting.shfmt.with({
					extra_args = { "-i", "2" }, -- Set indentation to 2 spaces
				}),

				-- null_ls.builtins.formatting.prettier,
				--- null_ls.builtins.diagnostics.erb_lint,
				-- null_ls.builtins.diagnostics.rubocop,
				-- null_ls.builtins.formatting.rubocop,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
