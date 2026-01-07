---@type LazySpec
return {
  {
    "antosha417/nvim-lsp-file-operations",
    -- lazy will handle loading nvim-tree and neo-tree appropriately based on the module load and our `init` function
    lazy = true,
    -- lazily load plugin after a tree plugin is loaded
    init = function(plugin) require("astrocore").on_load({ "neo-tree.nvim", "nvim-tree.lua" }, plugin.name) end,
    dependencies = {
      "AstroNvim/astrolsp",
      opts = function(_, opts)
        local operations = vim.tbl_get(require("astrocore").plugin_opts "nvim-lsp-file-operations", "operations") or {}
        local fileOperations = {}
        for _, operation in ipairs { "willRename", "didRename", "willCreate", "didCreate", "willDelete", "didDelete" } do
          fileOperations[operation] = vim.F.if_nil(vim.tbl_get(operations, operation .. "Files"), true)
        end
        opts.capabilities =
          vim.tbl_deep_extend("force", opts.capabilities or {}, { workspace = { fileOperations = fileOperations } })
      end,
    },
    main = "lsp-file-operations", -- set the main module name where the `setup` function is
    opts = {},
    specs = {
      { "AstroNvim/astrolsp", opts = { file_operations = false } },
    },
  },
  {
    "b0o/schemastore.nvim",
    lazy = true,
    specs = {
      {
        "AstroNvim/astrolsp",
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          config = {
            jsonls = {
              on_new_config = function(config)
                if not config.settings.json.schemas then config.settings.json.schemas = {} end
                vim.list_extend(config.settings.json.schemas, require("schemastore").json.schemas())
              end,
              settings = { json = { validate = { enable = true } } },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(
          opts.ensure_installed or {},
          { "javascript", "typescript", "tsx", "jsdoc", "json" }
        )
      end
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "jsonls", "vtsls", "denols", "eslint" })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "js" })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(
        opts.ensure_installed or {},
        { "json-lsp", "vtsls", "deno", "js-debug-adapter", "eslint-lsp", "prettierd" }
      )
    end,
  },
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
  {
    "yioneko/nvim-vtsls",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          nvim_vtsls = {
            {
              event = "LspAttach",
              desc = "Load nvim-vtsls with vtsls",
              callback = function(args)
                if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "vtsls" then
                  require("vtsls")._on_attach(args.data.client_id, args.buf)
                  vim.api.nvim_del_augroup_by_name "nvim_vtsls"
                end
              end,
            },
          },
        },
      },
    },
    config = function(_, opts) require("vtsls").config(opts) end,
  },
  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },
  {
    "echasnovski/mini.icons",
    opts = function(_, opts)
      if not opts.file then opts.file = {} end
      opts.file[".nvmrc"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file[".node-version"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file["package.json"] = { glyph = "", hl = "MiniIconsGreen" }
      opts.file["tsconfig.json"] = { glyph = "", hl = "MiniIconsAzure" }
      opts.file["tsconfig.build.json"] = { glyph = "", hl = "MiniIconsAzure" }
      opts.file["yarn.lock"] = { glyph = "", hl = "MiniIconsBlue" }
      local eslint_files = {
        -- ESLint <=8 (Deprecated)
        ".eslintignore",
        ".eslintrc",
        ".eslintrc.cjs",
        ".eslintrc.js",
        ".eslintrc.json",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        -- ESLint >=9
        "eslint.config.cjs",
        "eslint.config.cts",
        "eslint.config.js",
        "eslint.config.mjs",
        "eslint.config.mts",
        "eslint.config.ts",
      }
      for _, filename in ipairs(eslint_files) do
        opts.file[filename] = { glyph = "󰱺", hl = "MiniIconsYellow" }
      end

      local prettier_files = {
        ".prettierrc",
        ".prettierrc.cjs",
        ".prettierrc.cts",
        ".prettierrc.js",
        ".prettierrc.json",
        ".prettierrc.json5",
        ".prettierrc.mjs",
        ".prettierrc.mts",
        ".prettierrc.toml",
        ".prettierrc.ts",
        ".prettierrc.yaml",
        ".prettierrc.yml",
        "prettier.config.cjs",
        "prettier.config.js",
        "prettier.config.mjs",
        "prettier.config.mts",
        "prettier.config.ts",
      }
      for _, filename in ipairs(prettier_files) do
        opts.file[filename] = { glyph = "", hl = "MiniIconsPurple" }
      end
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = { { "nvim-neotest/neotest-jest", config = function() end } },
    opts = function(_, opts)
      if not opts.adapters then opts.adapters = {} end
      table.insert(opts.adapters, require "neotest-jest"(require("astrocore").plugin_opts "neotest-jest"))
    end,
  },
  {
    "sigmasd/deno-nvim",
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
    dependencies = {
      {
        "AstroNvim/astrolsp",
        opts = {
          handlers = {
            denols = false,
          },
        },
      },
    },
    opts = function(_, opts)
      local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
      if astrolsp_avail then opts.server = astrolsp.lsp_opts "denols" end
    end,
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          gs = {
            function() require("vtsls").commands.goto_source_definition() end,
            desc = "Goto Source Definition (vtsls)",
            cond = function(client) return client.name == "vtsls" end,
          },
        },
      },
      ---@diagnostic disable: missing-fields
      config = {
        vtsls = {
          settings = {
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            vtsls = {
              enableMoveToFileCodeAction = true,
            },
          },
        },
        denols = {
          -- adjust deno ls root directory detection
          root_dir = function(...) return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(...) end,
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      autocmds = {
        -- set up autocommand to choose the correct language server
        typescript_deno_switch = {
          {
            event = "LspAttach",
            callback = function(args)
              local bufnr = args.buf
              local curr_client = vim.lsp.get_client_by_id(args.data.client_id)

              if curr_client and curr_client.name == "denols" then
                local clients = (vim.lsp.get_clients) {
                  bufnr = bufnr,
                  name = "vtsls",
                }
                for _, client in ipairs(clients) do
                  vim.lsp.stop_client(client.id, true)
                end
              end

              -- if vtsls attached, stop it if there is a denols server attached
              if curr_client and curr_client.name == "vtsls" then
                if next((vim.lsp.get_clients) { bufnr = bufnr, name = "denols" }) then
                  vim.lsp.stop_client(curr_client.id, true)
                end
              end
            end,
          },
        },
      },
    },
  },
}
