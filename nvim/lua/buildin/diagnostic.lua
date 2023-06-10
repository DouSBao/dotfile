-- diagnostic sign
local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = " " },
	{ name = "DiagnosticSignInfo", text = " " }
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text })
end

-- diagnostic config
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	severity_sort = true,
	float = {
		border = user.ui.float.config.border,
		focusable = false,
		wrap = true,
		suffix = "",
	}
})

-- diagnostic autocmd
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

autocmd("CursorHold", {
	pattern = "*",
	group = loadonce,
	callback = function(env)
		if user.lsp.previewable then
			if not vim.diagnostic.is_disabled() and not user.lsp.previewing then
				vim.diagnostic.open_float()
			end
		end
	end
})

-- diagnostic keymaps
local opt = user.keymap.option

vim.keymap.set("n", "<Leader>dn", vim.diagnostic.goto_next, opt)
vim.keymap.set("n", "<Leader>db", vim.diagnostic.goto_prev, opt)
-- vim.keymap.set("n", "<Leader>ds", function()
-- 	local cursor = vim.api.nvim_win_get_cursor(0)
-- 	local diagnostics = vim.diagnostic.get(0, { lnum = cursor[1] - 1 })
-- 	
-- 	if diagnostics ~= nil and vim.fn.empty(diagnostics) == 0 then
-- 		if #diagnostics == 1 then
-- 			vim.diagnostic.set(diagnostics[1].namespace, diagnostics[1].bufnr, {})
-- 		else
-- 			vim.ui.select(diagnostics, { format_item = function(item) return item.message end, prompt = "Remove Diagnostic" }, 
-- 				function(select, index)
-- 					if select then
-- 						table.remove(diagnostics, index)
-- 						vim.diagnostic.set(select.namespace, select.bufnr, diagnostics)
-- 					end
-- 				end
-- 			)
-- 		end
-- 	end
-- end, opt)
