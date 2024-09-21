return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
    keys = "<leader>dpr",
	config = function()
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		local dap_python = require("dap-python")
		dap_python.setup(path)
		vim.keymap.set("n", "<leader>dpr", function()
			dap_python.test_method()
		end, { desc = "Run python test function" })
	end,
}
