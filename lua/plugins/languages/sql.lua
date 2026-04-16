---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if opts.treesitter.ensure_installed ~= "all" then
        opts.treesitter.ensure_installed =
          require("astrocore").list_insert_unique(opts.treesitter.ensure_installed or {}, { "sql" })
      end
      return require("astrocore").extend_tbl(opts, {
        filetypes = {
          extension = {
            pg = "sql",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "sqls" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "sqlfluff" })
      opts.handlers = opts.handlers or {}

      opts.handlers.sqlfluff = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.sqlfluff)
        null_ls.register(null_ls.builtins.formatting.sqlfluff)
      end
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "sqlfluff", "sqls" })
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      ---@diagnostic disable: missing-fields
      config = {
        sqls = {
          on_attach = function(client)
            -- Disable formatting due to bugs: https://github.com/sqls-server/sqls/issues/149
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
      },
    },
  },
  {
    "nanotee/sqls.nvim",
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          sqls_attach = {
            {
              event = "LspAttach",
              desc = "Load sqls.nvim with sqls",
              callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                if client.name == "sqls" then require("sqls").on_attach(client, args.buf) end
              end,
            },
          },
        },
      },
    },
  },
}
