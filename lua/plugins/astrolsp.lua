-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	"AstroNvim/astrolsp",
	---@param opts AstroLSPOpts
	opts = function(_, opts)
		-- Configuration table of features provided by AstroLSP
		opts.features.codelens = true -- enable/disable codelens refresh on start
		opts.features.inlay_hints = false -- enable/disable inlay hints on start
		opts.features.semantic_tokens = true -- enable/disable semantic token highlighting
		opts.features.signature_help = true -- enable/disable signature help on start
		opts.formatting.format_on_save = true -- enable/disable autoformatting on save
	end,
}
