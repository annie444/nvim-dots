---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { filetypes = { extension = {
      mdx = "markdown.mdx",
    } } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "marksman", "mdx_analyzer" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "marksman", "mdx-analyzer" })
    end,
  },
}
