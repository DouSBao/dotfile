local ok, dressing = pcall(require, "dressing")
if not ok then
	vim.notify("'dressing.nvim' not found", "error", { title = "plugin missing" })
	return
end

dressing.setup({
	input = {
		-- Set to false to disable the vim.ui.input implementation
		enabled = true,

		-- Default prompt string
		default_prompt = "Input:",

		-- Can be 'left', 'right', or 'center'
		title_pos = "left",

		-- When true, <Esc> will close the modal
		insert_only = true,

		-- When true, input will start in insert mode.
		start_in_insert = true,

		-- These are passed to nvim_open_win
		anchor = "NW",
		border = user.ui.float.config.border,
		-- 'editor' and 'win' will default to being centered
		relative = "cursor",

		-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		prefer_width = 40,
		width = nil,
		-- min_width and max_width can be a list of mixed types.
		-- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },

		buf_options = {},
		win_options = {
			-- Window transparency (0-100)
			winblend = user.ui.float.option.winblend,
			-- Disable line wrapping
			wrap = false,
			-- Indicator for when text exceeds window
			list = true,
			listchars = "precedes:…,extends:…",
			-- Increase this for more context when text scrolls off the window
			sidescrolloff = 0,
			-- Use fallback colors
			winhighlight = user.ui.float.option.winhighlight
		},

		-- Set to `false` to disable
		mappings = {
			n = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
			},
			i = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
				["<Up>"] = "HistoryPrev",
				["<Down>"] = "HistoryNext",
			},
		},

		override = function(conf)
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			conf.row = 1
			return conf
		end,

		-- see :help dressing_get_config
		get_config = nil,
	},
	select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,
    
        -- Priority list of preferred vim.select implementations
        backend = { "builtin" },
    
        -- Trim trailing `:` from prompt
        trim_prompt = true,
    
        -- Options for built-in selector
        builtin = {
			-- These are passed to nvim_open_win
			anchor = "NW",
			border = user.ui.float.config.border,
			-- 'editor' and 'win' will default to being centered
			relative = "cursor",

			buf_options = {},
			win_options = {
				-- Window transparency (0-100)
				winblend = user.ui.float.option.winblend,
				winhighlight = user.ui.float.option.winhighlight,
			},

			-- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- the min_ and max_ options can be a list of mixed types.
			-- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },

			-- Set to `false` to disable
			mappings = {
				["<Esc>"] = "Close",
				["<CR>"] = "Confirm",
			},

			override = function(conf)
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				conf.row = 1
				return conf
			end,
        },
    
		-- Used to override format_item. See :help dressing-format
		format_item_override = {},

		-- see :help dressing_get_config
		get_config = nil,
	},
})
