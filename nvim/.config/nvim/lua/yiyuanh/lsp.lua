local lsp = require("lsp-zero").preset({})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"javascript",
			"typescript",
			"lua",
		},
	},
})

lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		-- This just tells null-ls to recognize these sources.
		-- You still need to install them.
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.asmfmt,
		null_ls.builtins.formatting.beautysh,
		null_ls.builtins.formatting.clang_format,
		null_ls.builtins.formatting.cmake_format,
		null_ls.builtins.formatting.mdformat,
		null_ls.builtins.formatting.ocamlformat,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.ktlint,
		null_ls.builtins.formatting.latexindent,
		null_ls.builtins.formatting.json_tool,
	},
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = false,
})
