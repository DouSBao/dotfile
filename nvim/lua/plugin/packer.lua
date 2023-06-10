-- automatically install packer.nvim when bootstrap
local packer_bootstrap = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end

	return false
end

-- packer configuration
local packer_util = require "packer.util"
local packer = require "packer"

packer.init {
	display = {
		-- pretty float window
		open_fn = function()
			local _, win, buf = packer_util.float()

			vim.api.nvim_win_set_option(win, "winblend", user.ui.float.option.winblend)
			vim.api.nvim_win_set_option(win, "winhighlight", user.ui.float.option.winhighlight)

			return _, win, buf
    	end,
	},
	-- remove unused plugin without prompt
	autoremove = true
}

-- auto recompile plugins
local autocmd = vim.api.nvim_create_autocmd
local loadonce = user.augroup.loadonce

autocmd("BufWritePost", {
	pattern = "packer.lua",
	group = loadonce,
	command = "source <afile> | PackerSync"
})

-- packer plugins list
return packer.startup(function(use)
	-- let packer manage itself
	use "wbthomason/packer.nvim"

	-- useful library
	use "nvim-lua/plenary.nvim"
	use "BurntSushi/ripgrep"

	-- better ui
	use "stevearc/dressing.nvim"

	-- useful icons
	use "kyazdani42/nvim-web-devicons"

	-- buffer line
	use "akinsho/bufferline.nvim"

	-- status line
	use "nvim-lualine/lualine.nvim"

	-- snippet
	use "L3MON4D3/LuaSnip"

	-- completion engine with sources
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/nvim-cmp"

	-- lsp
	use "neovim/nvim-lspconfig"
	use "williamboman/mason-lspconfig.nvim"
	use "ray-x/lsp_signature.nvim"
	use "folke/lsp-colors.nvim"

	-- lsp extension framework
	use "jose-elias-alvarez/null-ls.nvim"

	-- dap
	use "mfussenegger/nvim-dap"
	use "jay-babu/mason-nvim-dap.nvim"
	use "rcarriga/nvim-dap-ui"

	-- external package manager
	use {
		"williamboman/mason.nvim",
		run = ":MasonUpdate"
	}

	-- autopair
	use "echasnovski/mini.pairs"

	-- smart comment
	use "numToStr/Comment.nvim"

	-- treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
    }

	-- telescope
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-ui-select.nvim"
	use { 
		"nvim-telescope/telescope-fzf-native.nvim", 
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && \
			cmake --build build --config Release && cmake --install build --prefix build" 
	}

	-- terminal
	use "akinsho/toggleterm.nvim"

	-- fancy notify window
	use {
		"rcarriga/nvim-notify",
		config = "vim.notify = require('notify')"
	}

	-- colorscheme
	use "folke/tokyonight.nvim"
	use { 
		"sainnhe/gruvbox-material", 
		config = "vim.cmd('colorscheme gruvbox-material')"
	}

	-- greeter
	use "goolord/alpha-nvim"

	-- animation
	use "echasnovski/mini.animate"

	-- comment keyword highlight
	use "folke/todo-comments.nvim"

	-- indent line
	use "lukas-reineke/indent-blankline.nvim"

	-- git
	use "lewis6991/gitsigns.nvim"

	if packer_bootstrap() then
		packer.sync()
	end
end)
