--[[
-- nvim-harpoon is the best plugin known to humankind
--]]
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	depependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		local map = vim.keymap.set
		map("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "add to harpoon" })
		map("n", "<A-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "toggle harpoon ui" })

		map("n", "<A-j>", function()
			harpoon:list():select(1)
		end, { desc = "Go to 1st harpoon file" })
		map("n", "<A-k>", function()
			harpoon:list():select(2)
		end, { desc = "Go to 2nd harpoon file" })
		map("n", "<A-l>", function()
			harpoon:list():select(3)
		end, { desc = "Go to 3rd harpoon file" })
		map("n", "<A-;>", function()
			harpoon:list():select(4)
		end, { desc = "Go to 4th harpoon file" })

		map("n", "<A-p>", function()
			harpoon:list():prev()
		end, { desc = "Go to previous harpoon file" })
		map("n", "<A-n>", function()
			harpoon:list():next()
		end, { desc = "Go to next harpoon file" })
	end,
	lazy = false,
}
