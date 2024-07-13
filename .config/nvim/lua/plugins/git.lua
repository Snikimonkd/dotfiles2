return {
	{
		"tpope/vim-fugitive",
	},
	{
		dependencies = {

			"tpope/vim-fugitive",
		},
		"tommcdo/vim-fugitive-blame-ext",
	},
	{
		-- git signs on the left
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
				ignore_whitespace = false,
			},
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				map("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true })

				-- Actions
				map("n", "<leader>sh", gs.stage_hunk)
				map("n", "<leader>rr", gs.reset_hunk)
				map("v", "<leader>sh", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>rr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>Sh", gs.stage_buffer)
				map("n", "<leader>uh", gs.undo_stage_hunk)
				map("n", "<leader>Rh", gs.reset_buffer)
				map("n", "<leader>rh", gs.preview_hunk)
				map("n", "<leader>bh", function()
					gs.blame_line({ full = true })
				end)
				--			map("n", "<leader>gb", gs.toggle_current_line_blame)

				map("n", "<leader>dh", gs.diffthis)
				map("n", "<leader>Dh", function()
					gs.diffthis("~")
				end)
				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
}
