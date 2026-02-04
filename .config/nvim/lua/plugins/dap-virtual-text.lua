return {
	"theHamsta/nvim-dap-virtual-text",
	event = "VeryLazy",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		enabled = true,
		highlight_changed_variables = true,
		highlight_new_as_changed = false,
		show_stop_reason = true,
		commented = false,
		only_first_definition = true,
		all_frames = false,
		virt_text_pos = "eol",
	},
}
