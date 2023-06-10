local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("'telescope.nvim' not found", "error", { title = "plugin missing" })
	return
end

-- telescope keymaps
local keymap = vim.api.nvim_set_keymap
local opt = user.keymap.option

keymap("n", "<Leader>tt", ":Telescope<CR>", opt)
keymap("n", "<Leader>tf", ":Telescope find_files<CR>", opt)
keymap("n", "<Leader>to", ":Telescope oldfiles<CR>", opt)
keymap("n", "<Leader>td", ":Telescope diagnostics<CR>", opt)

-- telescope config
telescope.setup({
	defaults = {
		-- nerd font is better
		prompt_prefix = "   ",
		selection_caret = " ",

		-- transparent
		winblend = user.ui.float.option.winblend,

		-- no full path
		path_display = { truncate = 3 },

		-- bottom layout, with clean border
		layout_strategy = 'bottom_pane',
		layout_config = { 
			height = 0.4,
            prompt_position = "bottom",
		},

		border = true,
        borderchars = { "─", "", "", "", "", "", "", "" },

		-- mappings
		mappings = {
			i = {
				["<Esc>"] = "close",
			},
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			search_dirs = {"$HOME/.config", "$PWD"},
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		},
		-- ["ui-select"] = {
		-- 	require("telescope.themes").get_dropdown {
		-- 		-- even more opts
		-- 		border = true,
		-- 		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		-- 		results_title = "Options",
		-- 		prompt_title = "Select",
		-- 		layout_strategy = 'horizontal',
		-- 	}
		-- },
	},
})

telescope.load_extension("fzf")
-- telescope.load_extension("ui-select")
