return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	keys = {
		{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Move to Tmux panel left" } },
		{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Move to Tmux panel down" } },
		{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Move to Tmux panel up" } },
		{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Move to Tmux panel right" } },
		{ "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Move to previous Tmux panel" } },
	},
}
