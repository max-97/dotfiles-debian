local bufnr = vim.api.nvim_get_current_buf()

local map = vim.keymap.set

map("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction")
end, { silent = true, buffer = bufnr, desc = "show code actions" })

map("n", "K", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { silent = true, buffer = bufnr, desc = "show hover information" })

map("n", "gd", function()
	vim.lsp.buf.definition()
end, { buffer = bufnr, desc = "goto definition" })

map("n", "gD", function()
	vim.lsp.buf.declaration()
end, { buffer = bufnr, desc = "goto declaration" })

map("n", "gt", function()
	vim.lsp.buf.type_definition()
end, { buffer = bufnr, desc = "goto type definition" })

map("n", "<leader>od", function()
	vim.cmd.RustLsp("openDoc")
end, { buffer = bufnr, desc = "open documentation" })
