-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
	base46 = { theme = "catppuccin" },
	ui = {
		statusline = {
			theme = "default",
			separator_style = "round",
		},
		tabufline = { enabled = false },
	},
	mason = {
		pkgs = {
			"debugpy",
			"ruff",
			"codelldb",
		},
	},
}

return M
