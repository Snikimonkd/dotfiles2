return {
	-- autocmp
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({})
		end,
	},
	{
		dir = "~/go/src/gh/cmp-go-pkgs",
	},
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			-- sourcescmp
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-path",

			-- snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",

			-- icons
			"onsails/lspkind.nvim",

			dir = "~/go/src/gh/cmp-go-pkgs",
			-- "Snikimonkd/cmp-go-pkgs",

			"kristijanhusak/vim-dadbod-completion",

			-- autopairs
			"windwp/nvim-autopairs",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			local mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-k>"] = cmp.mapping(
					cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					{ "i", "c" }
				),
				["<C-j>"] = cmp.mapping(
					cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					{ "i", "c" }
				),
			}

			cmp.setup({
				preselect = cmp.PreselectMode.Item,
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = {
						scrollbar = false,
						border = "rounded",
						winhighlight = "Normal:None,FloatBorder:FloatBorder,Search:None",
					},
					documentation = {
						border = "rounded",
						winhighlight = "Normal:None,FloatBorder:FloatBorder,Search:None",
					},
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
					{ name = "vim-dadbod-completion" },
					{ name = "go_pkgs" },
					{ name = "path" },
				},
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							nvim_lsp = "[lsp]",
							buffer = "[buf]",
							luasnip = "[snip]",
							nvim_lua = "[api]",
							go_pkgs = "[pkgs]",
							["vim-dadbod-completion"] = "[db]",
						},
					}),
				},
				sorting = {
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				mapping = mapping,
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
}
