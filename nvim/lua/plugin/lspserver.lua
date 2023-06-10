local ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
local ok2, lspconfig = pcall(require, "lspconfig")
if not ok1 or not ok2 then
	vim.notify("'mason-lspconfig.nvim' or 'lspconfig.nvim' not found, lsp server won't start", "error", { title = "plugin missing" })
	return
end

-- cmp has more capabilities than default lsp client
local capabilities
local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
else
	capabilities = vim.lsp.protocol.make_client_capabilities()
end

mason_lspconfig.setup({})
mason_lspconfig.setup_handlers({
	-- default handler
	function(server)
		lspconfig[server].setup({
			capabilities = capabilities
		})
	end,
	
	-- other handlers
	clangd = function()
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",		-- multiple attached servers support
			},
		})
	end,
})
