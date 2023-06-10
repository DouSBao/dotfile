-- global variables
user = {
	lsp = {
		-- enable previewing
		previewable = true,
		-- whether has active floating window created by lsp.util.open_floating_preview()
		previewing = false,
		close_events = nil,
		bufnr = nil,
		winnr = nil
	},
	ui = {
		float = {
			config = {
				border = "single",
			},
			option = {
				winblend = 20,
				winhighlight = "FloatBorder:,ErrorFloat:RedSign,WarningFloat:YellowSign,InfoFloat:BlueSign,HintFloat:GreenSign,NormalFloat:"
			}
		}
	},
	keymap = {
		option = {
			noremap = true,
			silent = true
		}
	},
	augroup = {
		-- augroup used to prevent loading autocmd twice
		loadonce = vim.api.nvim_create_augroup("UserdefLoadonce", { clear = true })
	}
}

