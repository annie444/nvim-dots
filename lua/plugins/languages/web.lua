---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed = require("astrocore").list_insert_unique(
          opts.treesitter.ensure_installed or {},
          { "html", "css", "scss", "styled", "php", "phpdoc" }
        )
      end
      vim.treesitter.language.register("scss", "less")
      vim.treesitter.language.register("scss", "postcss")
      return require("astrocore").extend_tbl(opts, {
        filetypes = { extension = {
          pcss = "postcss",
          postcss = "postcss",
        } },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed or {},
        { "html", "cssls", "emmet_ls", "phpactor" }
      )
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        html = { init_options = { provideFormatter = false } },
        cssls = { init_options = { provideFormatter = false } },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed or {},
        { "html-lsp", "css-lsp", "emmet-ls", "phpactor", "php-debug-adapter", "php-cs-fixer" }
      )
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "php" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "php-cs-fixer" })
    end,
  },
  {
    "echasnovski/mini.icons",
    opts = {
      filetype = {
        postcss = { glyph = "󰌜", hl = "MiniIconsOrange" },
      },
    },
  },
}
