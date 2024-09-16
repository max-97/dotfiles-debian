local M = {}

M.general = {
    n = {
        ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
        ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
        ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
        ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    },
    i = {
        ["<ESC>"] = { "<ESC><cmd>w<CR>", "Exit insert mode and save"},
    }
}

M.harpoon = {
    plugin = true,

    n = {
        ["<leader>a"] = { function () require('harpoon.mark').add_file() end },
        ["<A-e>"] = { function () require('harpoon.ui').toggle_quick_menu() end },
        ["<A-j>"] = { function () require('harpoon.ui').nav_file(1) end },
        ["<A-k>"] = { function () require('harpoon.ui').nav_file(2) end },
        ["<A-l>"] = { function () require('harpoon.ui').nav_file(3) end },
        ["<A-;>"] = { function () require('harpoon.ui').nav_file(4) end },
    },
}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Toggle Breakpoint"
        },
        ["<leader>dus"] = {
            function ()
                local widgets = require("dap.ui.widgets");
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        },
    },
}

M.dap_python = {
    plugin = true,
    n = {
        ["<leader>dpr"] = { function() require('dap-python').test_method() end }
    }
}

M.crates = {
    plugin = true,
    n = {
        ["<leader>rcu"] = {
            function ()
                require("crates").upgrade_all_crates()
            end,
            "Update crates"
        }
    }
}

M.undotree = {
    plugin = true,
    n = {
        ["<leader>u"] = { "<cmd>UndotreeToggle<CR>", "Toggle undotree" }
    }
}

M.lazygit = {
    plugin = true,
    n = {
        ["<leader>lg"] = { "<cmd>LazyGit<CR>", "Open lazygit" }
    }
}
return M
