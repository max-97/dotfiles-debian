return {
	"christoomey/vim-tmux-navigator",
	keys = {
		{ "<A-a>", "<cmd>TmuxNavigateLeft<cr>", { desc="Move to Tmux panel left"} },
		{ "<A-s>", "<cmd>TmuxNavigateDown<cr>", { desc="Move to Tmux panel down"} },
		{ "<A-d>", "<cmd>TmuxNavigateUp<cr>", { desc="Move to Tmux panel up"} },
		{ "<A-f>", "<cmd>TmuxNavigateRight<cr>", { desc="Move to Tmux panel right"} },
		{ "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc="Move to previous Tmus panel"} },
	},
}
