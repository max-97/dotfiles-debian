return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	init = function()
		-- The plugin's default terminal-mode mappings use <C-w>: (Vim-only) which Neovim
		-- forwards to the terminal job (e.g. lazygit), so disable them and define our own.
		vim.g.tmux_navigator_no_mappings = 1
	end,
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", mode = { "n", "t" }, desc = "Move to Tmux panel left" },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", mode = { "n", "t" }, desc = "Move to Tmux panel down" },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", mode = { "n", "t" }, desc = "Move to Tmux panel up" },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", mode = { "n", "t" }, desc = "Move to Tmux panel right" },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", mode = { "n", "t" }, desc = "Move to previous Tmux panel" },
	},
}
