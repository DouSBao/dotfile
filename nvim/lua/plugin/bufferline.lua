local ok, bufferline = pcall(require, "bufferline")
if not ok then
	vim.notify("'bufferline.nvim' not found", "error", { title = "plugin missing" })
	return
end

return bufferline.setup({
	options = {
		mode = "buffers",
		themable = true,
		numbers = "buffer_id",
		indicator = {
			icon = '▎',
			style = 'icon',
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 14,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = false,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		move_wraps_at_ends = false,
		separator_style = "think",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
		sort_by = "id"
	},
	highlights = {
		fill = {
			link = "BufferLineBackground"
		},
	}
})
