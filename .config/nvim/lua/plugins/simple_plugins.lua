return {
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"windwp/nvim-autopairs",
		opts = {},
	},
	{
		-- for git conflicts
		"akinsho/git-conflict.nvim",
		opts = {
			disable_diagnostics = true,
			list_opener = "copen",
			highlights = {
				incoming = "green",
				current = "blue",
			},
		},
	},
	{
		-- usefull go things
		"olexsmir/gopher.nvim",
		opts = {},
	},
	--	{
	--		-- http client
	--		"rest-nvim/rest.nvim",
	--		opts = {},
	--	},
	{
		-- vertical line between breakets
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				filetypes = { "dashboard" },
			},
		},
	},
	{
		-- highlight same words
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				delay = 100,
				filetypes_denylist = { "dashboard" },
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},
	{
		-- run tests
		"vim-test/vim-test",
	},
	{
		-- tracks time
		"wakatime/vim-wakatime",
	},
	{
		"Snikimonkd/yazmp",
		--		dir = "~/yazmp",
	},
}
