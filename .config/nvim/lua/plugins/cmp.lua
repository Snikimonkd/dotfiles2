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
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			{
				"MattiasMTS/cmp-dbee",
				dependencies = {
					{
						dir = "~/go/src/gh/nvim-dbee",
						-- "kndndrj/nvim-dbee",
					},
				},
				ft = "sql", -- optional but good to have
				opts = {}, -- needed
			},

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

			-- uncomment this when snippets are needed
			--			require("luasnip.loaders.from_vscode").lazy_load()

			local mapping = {
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({
								select = true,
							})
						end
					else
						fallback()
					end
				end),
				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
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
					{ name = "cmp-dbee" },
				},
				{ name = "path" },
				formatting = {
					format = lspkind.cmp_format({
						with_text = true,
						menu = {
							nvim_lsp = "[lsp]",
							buffer = "[buf]",
							luasnip = "[snip]",
							nvim_lua = "[api]",
							go_pkgs = "[pkgs]",
							["cmp-dbee"] = "[db]",
							["vim-dadbod-completion"] = "[db]",
						},
					}),
				},
				mapping = mapping,
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
}
