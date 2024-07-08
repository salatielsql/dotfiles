local null_ls = require("null-ls")

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
	sources = {
		formatting.prettierd.with({
			filetypes = { "html", "css", "typescript", "javascript", "typescriptreact", "javascriptreact" },
		}),
		formatting.stylua,
		formatting.jsonnetfmt.with({
			filetypes = { "json" },
		}),

		-- diagnostics
		diagnostics.eslint_d.with({
			filetypes = { "html", "css", "typescript", "javascript", "typescriptreact", "javascriptreact" },
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end,
})

require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
})
