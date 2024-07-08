require("telescope").setup({
	defaults = {
		initial_mode = "normal",
	},
	extensions = {
		file_browser = {
			hidden = { file_browser = true, folder_browser = false },
			files = true,
			select_buffer = true,
		},
	},
})

require("telescope").load_extension("file_browser")
