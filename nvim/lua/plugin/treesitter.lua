local ok1, config = pcall(require, "nvim-treesitter.configs")
local ok2, install = pcall(require, "nvim-treesitter.install")
if not ok1 or not ok2 then
	vim.notify("'treesitter.configs' or 'treesitter.install' modules not found", "error", { title = "plugin missing" })
	return
end

install.prefer_git = true
config.setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "cpp", "cmake", "make" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (for "all")
	ignore_install = {},

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},

	-- enable autopairs
	autopairs = {
		enable = true,
	},

	-- enable indent
	indent = {
		enable = true,
	}
})
