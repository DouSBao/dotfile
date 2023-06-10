local ok, lualine = pcall(require, "lualine")
if not ok then
	vim.notify("'lualine.nvim' not found", "error", { title = "plugin missing" })
	return
end

lualine.setup({
    options = { 
        icons_enabled = true,
		theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
			statusline = { "alpha" },
			winbar = {},
        },
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { 
			{ "diagnostics", colored = false } 
		},
		lualine_c = { "branch", "filename" },
		lualine_x = { "diff", "encoding", "filesize", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
})
