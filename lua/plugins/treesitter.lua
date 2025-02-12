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
		}
		if opts.ensure_installed ~= "all" then
			local remove = {}
			for i = 1, #opts.ensure_installed do
				if opts.ensure_installed[i] == "ansible-lint" then
					table.insert(remove, i)
				end
				if opts.ensure_installed[i] == "solargraph" then
					table.insert(remove, i)
				end
			end
			for i = 1, #remove do
				table.remove(opts.ensure_installed, remove[i])
			end
			opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, extras)
		end
	end,
}
