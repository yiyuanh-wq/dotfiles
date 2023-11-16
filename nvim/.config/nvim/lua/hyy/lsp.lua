local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

lsp.lua_ls.setup {}

lsp.ocamllsp.setup({
  root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace", "*.ml"),
})
