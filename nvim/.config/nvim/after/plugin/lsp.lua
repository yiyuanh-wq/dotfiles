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

lsp.setup()
