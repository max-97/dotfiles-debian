return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
		{
			"n",
			"<leader>dus",
			function()
				local widgets = require("dap.ui.widgets")
                local sidebar = widgets.sidebar(widgets.scopes)
                sidebar.open()
			end,
			{ desc = "Open debugging sidebar" },
		},
	},
}
