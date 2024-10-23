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
				-- go = { "gofumpt", "goimports", "golines" },
				go = { "gofmt", "goimports", "golines" },
				json = { "fixjson" },
				proto = { "buf" },
				["_"] = { "trim_whitespace" },
			},
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				else
					return {
						lsp_fallback = true,
					}
				end
			end,
			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				else
					return {
						lsp_fallback = true,
					}
				end
			end,
			notify_on_error = false,
		})
		conform.formatters.goimports = {
			prepend_args = { "-local", get_current_gomod() },
		}
		conform.formatters.golines = {
			prepend_args = { "--max-len", 120 },
		}

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
