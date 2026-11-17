return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = "markdown",
	opts = {
		-- Keep rendering in normal mode and never reveal raw markdown on the cursor line
		render_modes = { "n", "c", "t" },
		anti_conceal = { enabled = false },
		-- Limit block width to 120 columns instead of the full window
		heading = { width = "block", min_width = 120 },
		code = { width = "block", min_width = 120 },
		pipe_table = { preset = "round" },
	},
}
