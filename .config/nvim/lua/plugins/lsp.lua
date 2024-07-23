return {
	{
		"mizlan/delimited.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		dependecies = {
			"Chaitanyabsprip/fastaction.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/lsp_signature.nvim",
			"mizlan/delimited.nvim",
		},
		config = function()
			local keymap = vim.keymap
			local lspui = require("lspconfig.ui.windows")

			lspui.default_options.border = "rounded"

			vim.diagnostic.config({
				float = { border = "rounded" },
				underline = false,
			})
			keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			--	keymap.set("n", "[d", vim.diagnostic.goto_prev)
			--	keymap.set("n", "]d", vim.diagnostic.goto_next)
			keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lsp_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, {
						bufnr = bufnr,
					})
				end

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				--				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
				vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, bufopts)
				vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
				--				vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
				vim.keymap.set("n", "<space>of", function()
					vim.lsp.buf.format({ async = true })
				end, bufopts)

				vim.keymap.set("n", "[d", require("delimited").goto_prev, bufopts)
				vim.keymap.set("n", "]d", require("delimited").goto_next, bufopts)
			end

			local lspconfig = require("lspconfig")

			-- change border of documentation hover window
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
			})
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
			})

			lspconfig["gopls"].setup({
				capabilities = lsp_capabilities,
				on_attach = lsp_attach,
				filetypes = { "go" },
				settings = {
					buildFlags = { "-tags=integration,unit,db" },
					gopls = {
						analyses = {
							append = true,
							asmdecl = true,
							assign = true,
							atomic = true,
							unreachable = true,
							nilness = true,
							ST1003 = true,
							undeclaredname = true,
							fillreturns = true,
							nonewvars = true,
							fieldalignment = true,
							shadow = true,
							unusedvariable = true,
							unusedparams = true,
							useany = true,
							unusedwrite = true,
						},
						codelenses = {
							generate = true, -- show the `go generate` lens.
							gc_details = true, -- Show a code lens toggling the display of gc's choices.
							test = true,
							tidy = true,
							vendor = true,
							regenerate_cgo = true,
							upgrade_dependency = true,
						},
						hints = {
							assignVariableTypes = false,
							compositeLiteralFields = false,
							compositeLiteralTypes = false,
							constantValues = true,
							functionTypeParameters = false,
							parameterNames = false,
							rangeVariableTypes = false,
						},
						usePlaceholders = false,
						completeUnimported = true,
						staticcheck = true,
						matcher = "Fuzzy",
						symbolMatcher = "FastFuzzy",
						semanticTokens = false,
						--	noSemanticString = true, -- disable semantic string tokens so we can use treesitter highlight injection
						vulncheck = "Imports",
					},
				},
			})

			lspconfig["graphql"].setup({
				capabilities = lsp_capabilities,
				on_attach = lsp_attach,
				filetypes = { "graphql", "gql", "grpah" },
			})

			lspconfig["zls"].setup({
				capabilities = lsp_capabilities,
				on_attach = lsp_attach,
				filetypes = { "zig" },
			})

			lspconfig["lua_ls"].setup({
				on_attach = lsp_attach,
				capabilities = lsp_capabilities,

				-- and lua settings work only from here
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
}
