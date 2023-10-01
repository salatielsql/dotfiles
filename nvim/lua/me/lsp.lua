require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "html", "css", "javascript", "typescript", "json", "tsx" },
})

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
