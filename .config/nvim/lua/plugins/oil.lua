return {
	-- file explorer
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = false,
		columns = {
			{ "icon" },
			{ "mtime", highlight = "yellow" },
		},
		float = {
			max_width = 100,
			max_height = 100,
		},
		view_options = {
			show_hidden = true,
		},
	},
}
