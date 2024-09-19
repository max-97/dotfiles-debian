return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    depependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local map = vim.keymap.set
        map("n", "<leader>a", function() harpoon:list():add() end)
        map("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        map("n", "<A-j>", function() harpoon:list():select(1) end)
        map("n", "<A-k>", function() harpoon:list():select(2) end)
        map("n", "<A-l>", function() harpoon:list():select(3) end)
        map("n", "<A-;>", function() harpoon:list():select(4) end)

        map("n", "<A-S-P>", function() harpoon:list():prev() end)
        map("n", "<A-S-N>", function() harpoon:list():next() end)
    end,
    lazy = false,
}
