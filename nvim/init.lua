require("plugin.lazy")

require("nvim-treesitter.configs").setup({
	highlight = {
		enabled = true,
		additional_vim_regex_highlighting = false,
	},
	ensure_installed = { "lua", "html", "css", "astro", "javascript", "typescript", "json", "tsx" },
})

require("me.telescope")
require("me.keymap")
require("me.catpuccin")
require("me.options")
require("me.globals")
require("me.lualine")
require("me.lsp")
require("me.null_ls")
