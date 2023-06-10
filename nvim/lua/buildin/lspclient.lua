-- lsp client util wrapper
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce
local _vim_lsp_util_open_floating_preview = vim.lsp.util.open_floating_preview

vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
	local bufnr, winnr = _vim_lsp_util_open_floating_preview(contents, syntax, opts)
	local config = vim.api.nvim_win_get_config(winnr)

	user.lsp.previewing = true
	user.lsp.close_events = opts.close_events
	user.lsp.bufnr = bufnr
	user.lsp.winnr = winnr

	autocmd(opts.close_events, {
		pattern = "*",
		group = loadonce,
		once = true,
		callback = function(env)
			user.lsp.previewing = false
			user.lsp.close_events = nil
			user.lsp.bufnr = nil
			user.lsp.winnr = nil
		end
	})

	config["border"] = user.ui.float.config.border
	config["focusable"] = false
	vim.api.nvim_win_set_config(winnr, config)
	vim.api.nvim_win_set_option(winnr, "winblend", user.ui.float.option.winblend)
	vim.api.nvim_win_set_option(winnr, "winhighlight", user.ui.float.option.winhighlight)

	return bufnr, winnr
end

-- lsp client keymap
autocmd("LspAttach", {
	pattern = "*",
	group = loadonce,
	callback = function(env)
		local keymap = vim.keymap.set
		local opt = vim.deepcopy(user.keymap.option)
		
		opt["buffer"] = env.buf

		keymap("n", "<Leader>lf", vim.lsp.buf.format, opt)
		keymap("n", "<Leader>lr", vim.lsp.buf.references, opt)
		keymap("n", "<Leader>ld", vim.lsp.buf.definition, opt)
		keymap("n", "<Leader>lc", vim.lsp.buf.code_action, opt)
		keymap("n", "<Leader>ln", vim.lsp.buf.rename, opt)
		keymap("n", "<Leader>lp", function() 
			user.lsp.previewable = not user.lsp.previewable
			if not user.lsp.previewable and user.lsp.close_events ~= nil then
				vim.api.nvim_exec_autocmds(user.lsp.close_events, {})
			end
		end, opt)
	end
})

-- lsp client autocmd
autocmd("CursorHold", {
	buffer = 0,
	group = loadonce,
	callback = function(env)
		if user.lsp.previewable then
			local tmp = vim.lsp.semantic_tokens.get_at_pos()
			if vim.fn.empty(tmp) == 0 then
				if user.lsp.previewing then
					vim.api.nvim_win_close(user.lsp.winnr, true)
				end
				vim.lsp.buf.hover()
			end
		end
	end
})
