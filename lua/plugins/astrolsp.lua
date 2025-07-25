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
		opts.features.inlay_hints = true -- enable/disable inlay hints on start
		opts.features.semantic_tokens = true -- enable/disable semantic token highlighting
		opts.features.signature_help = true -- enable/disable signature help on start
		opts.formatting.format_on_save.enabled = true -- enable/disable autoformatting on save
		opts.formatting.timeout_ms = 10000 -- set timeout for formatting requests in milliseconds
		opts.config.rust_analyzer.settings = {
			["rust-analyzer"] = {
				imports = {
					granularity = {
						group = "module",
					},
					prefix = "self",
				},
				cargo = {
					buildScripts = {
						enable = true,
					},
					extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
					extraArgs = { "--profile", "rust-analyzer" },
				},
				procMacro = {
					enable = true,
					ignored = {
						leptos_macro = {
							"component",
							"server",
						},
					},
				},
			},
		}
	end,
}
