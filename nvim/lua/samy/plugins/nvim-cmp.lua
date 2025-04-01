return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source pour compléter le texte déjà présent dans le buffer
		"hrsh7th/cmp-path", -- source pour compléter les chemins des fichiers
		"hrsh7th/cmp-cmdline", -- source pour les completions de la cmdline de vim
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"hrsh7th/cmp-emoji", -- complétion d'émojis à la saisie de :
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		vim.api.nvim_set_hl(0, "MyNormal", { fg = "#D0D0F2" })
		vim.api.nvim_set_hl(0, "MyFloatBorder", { fg = "#9D9DFF" })
		vim.api.nvim_set_hl(0, "MyCursorLine", { bg = "#9D9DFF", fg = "black", bold = true, italic = true })

		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#D0D0F2", bg = "NONE" }) -- Main color for the text
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#D2A852", bg = "NONE", bold = true }) -- Match for the text typed
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#F96F6F", bg = "NONE" }) -- Fuzzy matched for the text typed

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-s>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
				{ name = "emoji" }, -- emojis
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				-- Comportement par défaut
				expandable_indicator = true,
				-- Champs affichés par défaut
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol_text",
					-- On suffixe chaque entrée par son type
					menu = {
						buffer = "[Buffer]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						path = "[Path]",
						emoji = "[Emoji]",
					},
				}),
			},

			window = {
				completion = cmp.config.window.bordered({
					border = "double",
					winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
				}),
				documentation = cmp.config.window.bordered({
					border = "double",
					winhighlight = "Normal:MyNormal,FloatBorder:MyFloatBorder,CursorLine:MyCursorLine,Search:None",
				}),
			},
		})

		-- `/` complétion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` complétion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
