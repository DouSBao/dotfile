local ok1, dap = pcall(require, "dap")
local ok2, mason_dap = pcall(require, "mason-nvim-dap")
if not ok1 or not ok2 then
	vim.notify("'dap.nvim' or 'mason-nvim-dap.nvim' not found", "error", { title = "plugin missing" })
	return
end

-- dap sign configs
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

autocmd("ColorScheme", {
	pattern = "*",
	group = loadonce,
	desc = "prevent colorscheme clears self-defined DAP icon colors.",
	callback = function()
		vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
		vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
		vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
	end
})

vim.fn.sign_define('DapBreakpoint', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=' ﳁ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=' ', texthl='DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=' ', texthl='DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=' ', texthl='DapStopped' })

-- dap keymap
local keymap = vim.keymap.set
local opt = user.keymap.option

keymap('n', '<F5>', function() dap.continue() end, opt)
keymap('n', '<F10>', function() dap.step_over() end, opt)
keymap('n', '<F11>', function() dap.step_into() end, opt)
keymap('n', '<F12>', function() dap.step_out() end, opt)
keymap('n', '<Leader>bb', function() dap.toggle_breakpoint() end, opt)
keymap('n', '<Leader>lb',
	function()
		vim.ui.input({ prompt = "Log point message: " },
			function(input)
				if input then
					dap.set_breakpoint(nil, nil, input)
				end
			end
		)
	end,
opt)

-- dap config
mason_dap.setup({
	handlers = {
		-- default handler
		function(config)
			-- all sources with no handler get passed here
			-- Keep original functionality
			require('mason-nvim-dap').default_setup(config)
        end,

		-- other handlers
	}
})

local ok, dapui = pcall(require, "dapui")
if ok then
	dapui.setup()

	dap.listeners.after.event_initialized["dapui_config"] = function()
		user.lsp.previewable = false
		dapui.open()
	end

	dap.listeners.before.event_terminated["dapui_config"] = function()
		user.lsp.previewable = true
		dapui.close()
	end

	dap.listeners.before.event_exited["dapui_config"] = function()
		user.lsp.previewable = true
		dapui.close()
	end

	dap.listeners.before.disconnect["dapui_config"] = function()
		user.lsp.previewable = true
		dapui.close()
	end
else
	vim.notify("'dapui.nvim' not found, UI won't display", "warn", { title = "plugin missing" })
end
