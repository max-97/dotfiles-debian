return {
	"saecki/crates.nvim",
	tag = "stable",
	event = { "BufRead Cargo.toml" },
	config = function()
	    local crates = require("crates")
        crates.setup()

        local map = vim.keymap.set
        map("n", "<leader>rcu", function() crates.upgrade_all_crates() end, { desc="Update crates" })
	end,
}
