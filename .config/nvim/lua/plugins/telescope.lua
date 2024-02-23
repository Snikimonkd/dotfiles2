return {
	{
		-- search
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"Snikimonkd/telescope-git-conflicts.nvim",
		},
		config = function()
			local actions = require("telescope.actions")
			require("telescope").setup({
				pickers = {
					live_grep = {
						-- previewer = require("telescope.config").values.grep_previewer.new(),
						additional_args = function()
							return { "--hidden" }
						end,
						file_ignore_patterns = { ".git/", "vendor", "bin", "go.sum" },
					},
					find_files = {
						hidden = true,
						no_ignore = true,
						file_ignore_patterns = { ".git/", "vendor", "bin", "go.sum" },
					},
					lsp_implementations = {
						fname_width = 9999,
						show_line = false,
					},
					lsp_references = {
						fname_width = 9999,
						show_line = false,
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-x>"] = actions.delete_buffer,
						},
					},
					layout_strategy = "vertical",
					layout_config = {
						preview_cutoff = 1,
					},
				},
			})

			require("telescope").load_extension("conflicts")
		end,
	},
}
