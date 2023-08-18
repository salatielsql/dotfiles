-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  hijack_cursor = true,
  update_focused_file = { enable = true, }, 
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  }
})

vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

