---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed =
          require("astrocore").list_insert_unique(opts.treesitter.ensure_installed, { "gleam" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      if vim.fn.executable "gleam" == 1 then
        opts.servers = require("astrocore").list_insert_unique(opts.servers, { "gleam" })
      end
    end,
  },
}
