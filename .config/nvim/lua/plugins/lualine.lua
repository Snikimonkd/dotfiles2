return {
	-- status line
	"nvim-lualine/lualine.nvim",
	config = function()
		local custom_theme = require("lualine.themes.gruvbox-material")
		custom_theme.normal.c.bg = "None"
		custom_theme.inactive.c.bg = "None"
		custom_theme.visual.c.bg = "None"
		custom_theme.replace.c.bg = "None"
		custom_theme.insert.c.bg = "None"
		custom_theme.command.c.bg = "None"
		require("lualine").setup({
			options = {
				theme = custom_theme,
				component_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							-- different mods have different length, so to make other sections stable i add spaces
							local extra = "       "
							str = str .. extra
							return str:sub(1, 7)
						end,
					},
				},
				lualine_b = {
					{
						"branch",
					},
					{
						"diagnostics",
						sources = { "nvim_workspace_diagnostic" },
					},
				},
				lualine_c = {
					{
						"buffers",
						icons_enabled = false,
						max_length = vim.o.columns * 9 / 10,
						symbols = {
							alternate_file = "",
						},
					},
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
