return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		-- some ui stuf
		vim.opt.termguicolors = true

		-- trasnparent background
		vim.g.gruvbox_material_transparent_background = 1
		-- for same words highlighting
		vim.g.gruvbox_material_current_word = "grey background"
		-- highlight line with error
		vim.g.gruvbox_material_diagnostic_text_highlight = 1
		-- highlight error message
		vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"
		-- soft background
		-- vim.g.gruvbox_material_background = "hard"
		-- For better performance
		vim.g.gruvbox_material_better_performance = 1

		vim.cmd.colorscheme("gruvbox-material")

		-- boarder of floating windows
		vim.api.nvim_set_hl(0, "FloatBorder", {
			fg = "Grey",
			bg = "none",
		})
		-- title of floating windows
		vim.api.nvim_set_hl(0, "FloatTitle", {
			fg = "Grey",
			bg = "none",
		})
		-- background color none
		vim.api.nvim_set_hl(0, "Normal", {
			bg = "none",
		})
		vim.api.nvim_set_hl(0, "NormalFloat", {
			bg = "none",
		})
	end,
}
