return {
	url = "https://codeberg.org/andyg/leap.nvim",
	keys = {
		{ "s", mode = "n", desc = "Foward search" },
		{ "S", mode = "n", desc = "Backward search" },
	},
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
		vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
		vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
	end,
}
