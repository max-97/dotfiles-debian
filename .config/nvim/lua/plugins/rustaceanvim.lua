--[[
-- Configures lsp automatically, does not need nvim-lspconfig for it.
-- Comes with rust-specific tooling, e.g. :RustLsp hover actions
--]]
return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false, -- This plugin is already lazy
}
