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
		"christoomey/vim-tmux-navigator",
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
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
		-- autopairs
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		-- usefull go things
		"olexsmir/gopher.nvim",
		opts = {
			gotests = {
				template_dir = "/Users/slukash/.config/nvim/lua/plugins/gotests_templates",
			},
		},
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
		-- "Snikimonkd/yazmp",
		dir = "~/go/src/gh/yazmp",
	},
}
