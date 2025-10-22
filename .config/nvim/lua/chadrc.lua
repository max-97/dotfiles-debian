-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
	base46 = { theme = "catppuccin", transparency = true },
	ui = {
		statusline = {
			theme = "default",
			separator_style = "round",
		},
		tabufline = { enabled = false },
	},
	mason = {
		pkgs = {
			"debugpy", -- Python debugger
			"ruff", -- Python LSP
			"codelldb", -- C/C++, Rust debugger
			"postgrestools",
			"clangd", -- C/C++ LSP
			"cmake-language-server", -- CMake LSP
			"checkmake", -- Makefile Linter
		},
	},
}

return M
