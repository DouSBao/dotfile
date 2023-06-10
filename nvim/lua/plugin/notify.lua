local ok, notify = pcall(require, "notify")
if not ok then
	vim.notify("'notify.nvim' not found", "error", { title = "plugin missing" })
	return
end

notify.setup({
	background_colour = "NotifyBackground",
	fps = 60,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},
	level = 2,
	minimum_width = 50,
	render = "default",
	stages = "fade",
	timeout = 2000,
	top_down = true
})
