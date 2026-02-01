return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
		{
			"<leader>dus",
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			{ desc = "Open debugging sidebar" },
		},
		{ "<leader>dr", "<cmd>DapContinue<cr>", { desc = "Start or continue debugging" } },
	},
}
