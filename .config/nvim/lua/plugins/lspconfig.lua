return {
	"neovim/nvim-lspconfig",
	opts = {
		setup = {
			rust_analyzer = function()
				return true -- prevent Mason from setting up lspconfig.rust_analyzer, see rustaceanvim docs
			end,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local nvlsp = require("nvchad.configs.lspconfig")

		-- default lua from nvchad + awesome wm setup
		dofile(vim.g.base46_cache .. "lsp")
		require("nvchad.lsp").diagnostic_config()

		lspconfig.lua_ls.setup({
			on_attach = nvlsp.on_attach,
			capabilities = nvlsp.capabilities,
			on_init = nvlsp.on_init,
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
							"awesome",
							"awful",
							"client",
							"gears",
							"screeen",
							"tag",
							"root",
						},
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
							vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
							vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
							"${3rd}/luv/library",
							"${3rd}/busted/library",
							"/usr/local/share/awesome/lib",
							"/usr/share/lua",
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})

		lspconfig.clangd.setup({
			on_attach = nvlsp.on_attach,
			on_init = nvlsp.on_init,
			capabilities = nvlsp.capabilities,

			cmd = {
				"clangd",
				"--compile-commands-dir=build",
				"--clang-tidy",
			},
		})

		local servers = { "ruff", "postgres_lsp", "mesonlsp" }

		-- lsps with default config
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = nvlsp.on_attach,
				on_init = nvlsp.on_init,
				capabilities = nvlsp.capabilities,
			})
		end
	end,
}
