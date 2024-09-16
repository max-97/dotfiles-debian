local plugins = {
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        'ThePrimeagen/harpoon',
        depependencies = "nvim-lua/plenary.nvim",
        init = function ()
            require("core.utils").load_mappings("harpoon")
        end,
        layz = false,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            panel = {
                keymap = {
                    open = "<M-o>",
                },
            },
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<M-CR>",
                },
            },
        },
        config = function(_, opts)
          require("copilot").setup(opts)
        end,
    },
    -- LSP & DAP
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "rust-analyzer",
                "black",
                "debugpy",
                "mypy",
                "ruff",
                "pyright",
            },
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = { "python" },
        opts = function ()
            return require "custom.configs.null-ls"
        end,
    },
    {
        'neovim/nvim-lspconfig',
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        depependencies = "neovim/nvim-lspconfig",
        opts = function ()
            return require "custom.configs.rust-tools"
        end,
        config = function (_, opts)
            require("rust-tools").setup(opts)
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function (_, opts)
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function (_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("core.utils").load_mappings("dap_python")
        end
    },
    {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        config = function (_, opts)
            local crates = require("crates")
            crates.setup(opts)
            crates.show()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        opts = function ()
            local M = require "plugins.configs.cmp"
            table.insert(M.sources, {name = "crates"})
            return M
        end,
    },
    -- my setup
    {
        'mbbill/undotree',
        cmd = "UndotreeToggle",
        init = function ()
            require("core.utils").load_mappings("undotree")
        end,
    },
    {
        "tpope/vim-repeat",
    },
    {
        "ggandor/leap.nvim",
        keys = {
            { "s", mode = "n", desc = "Foward search" },
            { "S", mode = "n", desc = "Backward search" },
        },
        dependencies = {
            "tpope/vim-repeat",
        },
        config = function ()
            require("leap").add_default_mappings()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        depependencies = {
            "nvim-lua/plenary.nvim"
        },
        init = function ()
            require("core.utils").load_mappings("lazygit")
        end,
    }
}
return plugins
