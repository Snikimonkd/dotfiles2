return {
	"nvimdev/dashboard-nvim",
	dependecies = {
		"nvim-tree/nvim-web-devicons",
	},
	priority = 999,
	event = "VimEnter",
	lazy = false,
	opts = {
		theme = "doom",
		config = {
			week_header = {
				enable = true,
			},
			center = {
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Database",
					group = "@property",
					action = "DBUI",
					key = "d",
				},
			},
		},
	},
}
