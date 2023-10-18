-- init lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "

-- plugins table
local plugins = {
	-- theme
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- statusbar and buffers list
	"nvim-lualine/lualine.nvim",

	-- treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- trying file browser
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- comments
	{
		"numToStr/Comment.nvim",
		opts = {
			opleader = {
				block = "<leader>cc",
			},
		},
		lazy = false,
	},

	-- git
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
		},
		config = {
			kind = "vsplit",
			integrations = {
				telescope = true,
				diffview = true,
				fzf_lua = nil,
			},
		},
	},
}

require("lazy").setup(plugins)
