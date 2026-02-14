-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {
	base46 = {
		theme = "catppuccin",
		hl_override = {
			Comment = {
				italic = true,
				fg = "#bac2de", -- Subtext 1
			},
			["@comment"] = {
				italic = true,
				fg = "#bac2de", -- Subtext 1
			},
		},
		transparency = true,
		integrations = { "dap" },
	},
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
			"postgres-language-server",
			"clangd", -- C/C++ LSP
			"cmake-language-server", -- CMake LSP
			"checkmake", -- Makefile Linter
			"mesonlsp", -- Meson LSP
		},
	},
}

return M
