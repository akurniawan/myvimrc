local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Auto format on save for Python files
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.py", "*.lua", "*.go" },
	callback = function()
		vim.lsp.buf.format({
			async = true,
			timeout_ms = 5000, -- Adjust timeout as needed
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})
