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
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				expand_lines = true,
				layouts = {
					{
						elements = {
							{
								id = "repl",
								size = 0.5,
								position = "right",
							},
							{
								id = "scopes",
								size = 0.5,
								position = "left",
							},
						},
						position = "bottom",
						size = 15,
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
