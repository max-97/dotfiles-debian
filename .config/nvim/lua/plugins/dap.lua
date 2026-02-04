return {
	"mfussenegger/nvim-dap",
	keys = {
		{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle Breakpoint" } },
		{
			"<leader>dL",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
			{ desc = "Set Breakpoint with log message" },
		},
		{
			"<leader>dc",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "), nil, nil)
			end,
			{ desc = "Set Breakpoint with condition" },
		},
		{ "<leader>dr", "<cmd>DapContinue<cr>", { desc = "Start or continue debugging" } },
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			{ desc = "Run last debugging session" },
		},
		{ "<leader><Down>", "<cmd>DapStepOver<cr>", { desc = "Step over" } },
		{ "<leader><Right>", "<cmd>DapStepInto<cr>", { desc = "Step into" } },
		{ "<leader><Left>", "<cmd>DapStepOut<cr>", { desc = "Step out" } },
		{
			"<leader><Up>",
			function()
				require("dap").restart()
			end,
			{ desc = "Restart session" },
		},
		{ "<leader>dq", "<cmd>DapTerminate<cr>", { desc = "Terminate debugging" } },
	},
}
