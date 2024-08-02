return {
	dir = "~/go/src/gh/nvim-dbee",
	-- "kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"MattiasMTS/cmp-dbee",
			ft = { "sql" },
			lazy = true,
		},
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			window_layout = require("dbee.layouts").Default:new({
				call_log_height = 10,
				call_log_enabled = false,
			}),
			sources = {
				require("dbee.sources").MemorySource:new({
					require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
				}),
				require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
				require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
			},
		})
	end,
}
