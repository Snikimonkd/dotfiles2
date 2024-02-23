vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "red" })
return {
	-- debug
	{
		"leoluz/nvim-dap-go",
		opts = {},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require("dap").set_log_level("debug")

			vim.keymap.set("n", "<leader>bp", ":DapToggleBreakpoint<CR>")

			vim.keymap.set("n", "<leader>dw", function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes, nil, "bot split")
				sidebar.open()
			end)

			vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test)
			vim.keymap.set("n", "<leader>dk", ":lua require('dap.ui.variables').hover()<CR>")
			vim.keymap.set("n", "<leader>sc", require("dap").continue)
			vim.keymap.set("n", "<leader>so", require("dap").step_over)
			vim.keymap.set("n", "<leader>si", require("dap").step_into)
			vim.keymap.set("n", "<leader>ds", require("dap").terminate)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
				expand_lines = true,
				layouts = {
					{
						elements = { {
							id = "scopes",
							size = 1,
						} },
						position = "bottom",
						size = 20,
					},
					{
						elements = {
							{
								id = "repl",
								size = 1,
							},
							{
								id = "watches",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
				},
				render = {
					indent = 1,
					max_value_lines = 10000,
					max_type_length = 10000,
				},
			})
			vim.keymap.set("n", "<leader>do", require("dapui").open)
			vim.keymap.set("n", "<leader>dc", require("dapui").close)
		end,
	},
}
