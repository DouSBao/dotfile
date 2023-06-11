local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
	vim.notify("'gitsigns.nvim' not found", "error", { title = "plugin missing" })
	return
end

require('gitsigns').setup({
	signs = {
		add          = { text = '│' },
		change       = { text = '│' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
	numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true
	},
	attach_to_untracked = true,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
		delay = 100,
		ignore_whitespace = false,
	},
	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d>',
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = user.ui.float.config.border,
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1
	},
	yadm = {
		enable = false
	},
})

-- gisigns keymap
local keymap = vim.api.nvim_set_keymap
local opt = user.keymap.option

keymap("n", "<Leader>gp", ":Gitsigns preview_hunk_inline<CR>", opt)
keymap("n", "<Leader>gs", ":Gitsigns stage_hunk<CR>", opt)
keymap("n", "<Leader>gw", ":Gitsigns stage_buffer<CR>", opt)
keymap("n", "<Leader>gu", ":Gitsigns undo_stage_hunk<CR>", opt)
keymap("n", "<Leader>gr", ":Gitsigns reset_hunk<CR>", opt)
keymap("n", "<Leader>gn", ":Gitsigns next_hunk<CR>", opt)
keymap("n", "<Leader>gb", ":Gitsigns prev_hunk<CR>", opt)
