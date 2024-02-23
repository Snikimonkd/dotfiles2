local get_current_gomod = function()
	local file = io.open("go.mod", "r")
	if file == nil then
		return nil
	end

	local first_line = file:read()
	local mod_name = first_line:gsub("module ", "")
	file:close()
	return mod_name
end

return {
	-- formatter
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports", "golines" },
				-- go = { "gofmt", "goimports" },
				json = { "fixjson" },
				proto = { "buf" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = true,
			},
			notify_on_error = false,
		})
		conform.formatters.goimports = {
			prepend_args = { "-local", get_current_gomod() },
		}
	end,
}
