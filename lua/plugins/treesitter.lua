-- Customize Treesitter

---@type LazySpec
return {

	"nvim-treesitter/nvim-treesitter",
	optional = true,
	opts = function(_, opts)
		-- Ensure that opts.ensure_installed exists and is a table or string "all".
		local extras = {
			"comment",
			"bibtex",
			"asm",
			"awk",
			"diff",
			"embedded_template",
			"fortran",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"git_config",
			"git_rebase",
			"gnuplot",
			"gpg",
			"http",
			"mermaid",
			"org",
			"jinja",
			"jinja_inline",
		}
		if opts.ensure_installed ~= "all" then
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, extras)
		end
	end,
}
