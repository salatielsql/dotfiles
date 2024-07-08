local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"cssls",
		"cssmodules_ls",
		"tailwindcss",
		"html",
		"jsonls",
		"lua_ls",
		"eslint",
		"astro",
	},
})

lspconfig.tsserver.setup({})
lspconfig.cssls.setup({})
lspconfig.cssmodules_ls.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.html.setup({})
lspconfig.jsonls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.astro.setup({})
