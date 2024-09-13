return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"roobert/tailwindcss-colorizer-cmp.nvim",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"neovim/nvim-lspconfig",
		"onsails/lspkind.nvim",
		"simrat39/rust-tools.nvim",
		-- Ensure Tailwind CSS LSP is correctly set up
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
	},
	event = { "BufReadPre", "BufNewFile", "InsertEnter" },
	version = "v2.*",
	build = "make install_jsregexp",

	config = function()

		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,preview,noselect,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = 'nvim_lsp_signature_help' },
				{ name = 'nvim_lua',               keyword_length = 2 },
				{ name = 'buffer',                 keyword_length = 2 },
				{ name = 'vsnip',                  keyword_length = 2 },
				{ name = "luasnip" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
				format = require("tailwindcss-colorizer-cmp").formatter,
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = 'λ',
						vsnip = '⋗',
						buffer = 'Ω',
						path = '',
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,
}
