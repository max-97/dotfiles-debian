return {
	"ggandor/leap.nvim",
	keys = {
		{ "s", mode = "n", desc = "Foward search" },
		{ "S", mode = "n", desc = "Backward search" },
	},
	dependencies = {
		"tpope/vim-repeat",
	},
	config = function()
		require("leap").add_default_mappings()
	end,
}
