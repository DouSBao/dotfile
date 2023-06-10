local ok, indent = pcall(require, "indent_blankline")
if not ok then
	vim.notify("'indent-blankline.nvim' not found", "error", { title = "plugin missing" })
	return
end

require("indent_blankline").setup({})
