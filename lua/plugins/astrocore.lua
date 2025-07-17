-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = false,
			signs = true,
			float = true,
			update_in_insert = false,
			severity_sort = true,
		},
		-- Configuration of vim mappings to create
		mappings = {
			-- map mode (:h map-modes)
			n = {
				["<leader>ul"] = { ":Neominimap Toggle<cr>", desc = "Toggle the minimap" },
			},
		},
		sessions = {
			-- Configure auto saving
			autosave = {
				last = true, -- auto save last session
				cwd = true, -- auto save session for each working directory
			},
			-- Patterns to ignore when saving sessions
			ignore = {
				dirs = {}, -- working directories to ignore sessions in
				filetypes = { "gitcommit", "gitrebase" }, -- filetypes to ignore sessions
				buftypes = {}, -- buffer types to ignore sessions
			},
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true, -- sets vim.opt.number
				spell = false, -- sets vim.opt.spell
				signcolumn = "yes", -- sets vim.opt.signcolumn to yes
				wrap = true, -- sets vim.opt.wrap
				guifont = "JetBrainsMono Nerd Font Mono:h12", -- sets vim.opt.guifont
			},
		},
	},
}
