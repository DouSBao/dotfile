local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	vim.notify("'toggleterm.nvim' not found", "error", { title = "plugin missing" })
	return
end

toggleterm.setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return vim.o.lines * 0.3
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	open_mapping = [[<C-\>]],
	hide_numbers = true,
	autochdir = true,
	direction = "float",
	shading_factor = '2',
	terminal_mappings = false,
})

-- toggleterm
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

autocmd("TermOpen", {
	pattern = "term://*",
	group = loadonce,
	desc = "apply escape keymap to terminal",
	callback = function(env)
		local keymap = vim.api.nvim_buf_set_keymap
		local opt = user.keymap.option

		keymap(0, 't', '<Esc>', '<C-\\><C-n>', opt)
		keymap(0, 't', '<C-Left>', '<Cmd>wincmd h<CR>', opt)
		keymap(0, 't', '<C-Up>', '<Cmd>wincmd j<CR>', opt)
		keymap(0, 't', '<C-Down>', '<Cmd>wincmd k<CR>', opt)
		keymap(0, 't', '<C-Right>', '<Cmd>wincmd l<CR>', opt)
		keymap(0, 't', '<C-\\>', '<Cmd>ToggleTerm<CR>', opt)
	end,
})
