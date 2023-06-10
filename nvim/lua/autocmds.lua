-- basic autocmds
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

-- place help page in new buffer of current window
autocmd("FileType", {
	pattern = "help",
	group = loadonce,
	callback = function(env)
		local wins = vim.api.nvim_list_wins()
		vim.api.nvim_buf_set_option(env.buf, "buflisted", true)
		for i = 2, #wins do
			vim.api.nvim_win_close(wins[i], false)
		end
	end
})
