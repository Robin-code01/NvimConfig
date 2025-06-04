-- lua/plugins/null-ls.lua
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		-- none-ls-extras provides the ESLint diagnostics source
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Load the ESLint diagnostics helper from none-ls-extras
		-- (this will provide linting: warnings + errors)
		local eslint_diag = require("none-ls.diagnostics.eslint")

		null_ls.setup({
			sources = {
				-- **Formatting:**
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.eslint_d,

				-- **Diagnostics (warnings/errors) via ESLint:**
				eslint_diag,

				-- **Completion:**
				null_ls.builtins.completion.cspell,
			},
		})

		-- Map <leader>gf to run LSP-format (so prettier/stylua/eslint_d run on save or manually)
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
