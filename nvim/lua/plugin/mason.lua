local ok, mason = pcall(require, "mason")
if not ok then
	vim.notify("'mason.nvim' not found", "error", { title = "plugin missing" })
	return
end

mason.setup({})
