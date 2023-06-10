local ok, cmp = pcall(require, "cmp")
if not ok then
	vim.notify("'cmp.nvim' not found", "error", { title = "plugin missing" })
	return
end

local luasnip = require("luasnip")
local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}

-- cmp global config
cmp.setup({
	snippet = {
		expand = function(args) 
			require("luasnip").lsp_expand(args.body) 
		end,
	},

	-- disable completion in comments
	enabled = function()
		local context = require("cmp.config.context")
		-- keep command mode completion enabled when cursor is in a comment
		if vim.api.nvim_get_mode().mode == 'c' then
			return true
		else
			return not context.in_treesitter_capture("comment") 
				and not context.in_syntax_group("Comment")
		end
    end,

	-- disable preselect
	preslect = cmp.PreselectMode.None,

	window = {
		completion = {
			border = user.ui.float.config.border,
			winhighlight = user.ui.float.option.winhighlight
		},
		documentation = {
			border = user.ui.float.config.border,
			winhighlight = user.ui.float.option.winhighlight
		}
	},

    mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Up>"] = cmp.mapping(function(fallback)
			vim.cmd [[call feedkeys("\<Up>", 'n')]]
		end),
		["<Down>"] = cmp.mapping(function(fallback)
			vim.cmd [[call feedkeys("\<Down>", 'n')]]
		end)
    }),

    sources = cmp.config.sources({
		{ name = "nvim_lsp" },
        { name = 'luasnip' },
		{ name = "buffer", keyword_length = 2 },
		{ name = "path" },
	}),

	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = kind_icons[vim_item.kind]
			-- Source
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[Snip]",
				buffer = "[Buffer]",
				path = "[Path]",
				cmdline = "[Builtin]",
			})[entry.source.name]
			return vim_item
		end
	},
})

-- cmp specific configs
cmp.setup.filetype({ "TelescopePrompt" }, {
	enabled = false
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
		{ name = "cmdline" },
		{ name = "path" },
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
		{ name = "buffer" },
	})
})
