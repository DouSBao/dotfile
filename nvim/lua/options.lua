-- basic options
local options = {
	belloff = "all",								-- no bell
	cursorline = true,								-- highlight cursor line
	mouse = "",										-- disable mouse
	number = true, 									-- report line number
	pumheight = 10,									-- shorter popup height
	pumblend = user.ui.float.option.winblend, 		-- transparent popup
	tabstop = 4,
	shiftwidth = 4,									-- 4 space per tab
	wrap = false,									-- no wrap
	termguicolors = true,							-- enable 24-bit RGB color
	autochdir = true,								-- auto change pwd
	smartindent = true,
	completeopt = "menu,menuone,noselect",			-- :h completeopt
	swapfile = false, 								-- no swapfile due to CursorHold
	updatetime = 800, 								-- used by CursorHold(I)
}

for key, val in pairs(options) do
	vim.o[key] = val
end
