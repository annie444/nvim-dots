---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure that opts.ensure_installed exists and is a table or string "all".
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "astro" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "astro" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "astro-language-server" })
    end,
  },
}
