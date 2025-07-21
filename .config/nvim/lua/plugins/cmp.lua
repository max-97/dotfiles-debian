---[[
--- nvim-cmp is a completion engine for neovim.
---]]
return {
	"hrsh7th/nvim-cmp",
	opts = function()
		local M = require("nvchad.configs.cmp")
		table.insert(M.sources, { name = "crates" })
		return M
	end,
}
