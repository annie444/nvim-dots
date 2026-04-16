---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed =
          require("astrocore").list_insert_unique(opts.treesitter.ensure_installed or {}, { "zig" })
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "lawrence-laz/neotest-zig", version = "^1", config = function() end },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-zig"(require("astrocore").plugin_opts "neotest-zig"))
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "zls" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "zls" })
    end,
  },
}
