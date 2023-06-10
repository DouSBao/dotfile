local ok, alpha = pcall(require, "alpha")
if not ok then
	vim.notify("'alpha.nvim' not found", "error", { title = "plugin missing" })
	return
end

local term = require("alpha.term")

alpha.setup({
	layout = {
		{
			type = "terminal",
			command = "chafa --fg-only --size=" .. 
				vim.api.nvim_win_get_width(0) - 20 .. 
				"x --symbols braille " .. 
				vim.fn.expand("$HOME") .. 
				"/.local/share/nvim/arch.gif",
			width = vim.api.nvim_win_get_width(0) - 20, -- number
			height = vim.api.nvim_win_get_height(0) - 2, -- number
			opts = {
				redraw = true,
				window_config = {
					relative = "editor",
					row = 0,
				}
			}
		},
		{
			type = "button",
			val = "󰅭 PRESS 'ENTER' TO START HACKING [" .. 
					vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1)) ..  "] ",
			on_press = function() vim.cmd [[Telescope]] end,
			opts = {
				position = "center",
				hl = "Comment",
				cursor = 9,
			}
		},
	}
})

-- alpha autocmds
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

autocmd("User", {
	pattern = "AlphaReady",
	group = loadonce,
	callback = function()
		vim.cmd [[set showtabline=0]]
		autocmd("BufUnload", {
			buffer = 0,
			once = true,
			group = loadonce,
			command = "set showtabline=2"
		})
	end
})
