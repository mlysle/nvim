local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.write_good,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.shfmt,
	},
})
