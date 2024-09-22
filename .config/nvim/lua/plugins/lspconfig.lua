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
		-- load defaults i.e lua_lsp
		require("nvchad.configs.lspconfig").defaults()

		local lspconfig = require("lspconfig")

		local servers = { "ruff" }
		local nvlsp = require("nvchad.configs.lspconfig")

		-- lsps with default config
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = nvlsp.on_attach,
				on_init = nvlsp.on_init,
				capabilities = nvlsp.capabilities,
			})
		end

		-- configuring single server, example: typescript
		-- lspconfig.ts_ls.setup {
		--   on_attach = nvlsp.on_attach,
		--   on_init = nvlsp.on_init,
		--   capabilities = nvlsp.capabilities,
		-- }
	end,
}
