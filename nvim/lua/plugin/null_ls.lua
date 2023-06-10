local ok, null_ls = pcall(require, "null-ls")
if not ok then
	vim.notify("'null-ls.nvim' not found", "error", { title = "plugin missing" })
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.cppcheck,
		null_ls.builtins.formatting.astyle.with({
			extra_args = {
				"--style=webkit",
				"--indent=spaces=4", 		-- use 4 spaces per indent
				"--attach-namespaces", 		-- attach braces to namespace
				"--attach-classes",
				"--attach-extern-c",
				"--attach-closing-while", 	-- do while
				"--indent-switches", 		-- indent switch's inner blocks
				"--indent-cases", 			-- indent caes' inner blocks
				"--pad-oper", 				-- insert space around operators
				"--pad-comma",
				"--pad-header", 			-- padding after 'if', 'for', etc...
				"--squeeze-lines=1", 		-- squeeze lines to 1 line
				"--align-pointer=name", 	-- int *p
				"--align-reference=name",  	-- int &r
			}
		})
	},
	update_in_insert = true,
	temp_dir = vim.fn.expand("$HOME") .. "/.local/share/nvim"
})
 
-- -- auto format before write to disk
-- local autocmd = vim.api.nvim_create_autocmd
-- local loadonce = user.augroup.loadonce
--
-- autocmd("BufWritePre", {
-- 	pattern = { "*.cpp", "*.c", "*.h", "*.hpp" },
-- 	group = load_once,
-- 	desc = "before write to disk, format the file without changing cursor position.",
-- 	callback = function()
-- 		local tmp = vim.api.nvim_win_get_cursor(0)
-- 		vim.cmd [[w]]
-- 		vim.lsp.buf.format()
-- 		vim.api.nvim_win_set_cursor(0, tmp)
-- 	end,
-- })
