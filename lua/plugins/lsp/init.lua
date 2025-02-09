return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  config = function()
    require("plugins.lsp.handlers").setup()
  end,
  dependencies = {
    {
      "folke/neodev.nvim",
      event = "LspAttach",
      config = function()
        require("neodev").setup {
          library = {
            enabled = true,    -- When not enabled, neodev will not change any settings to the LSP server
            runtime = true,    -- Runtime path
            types = true,      -- Full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true,    -- Installed opt or start plugins in packpath
          },
          setup_jsonls = true, -- Configures jsonls to provide completion for project specific .luarc.json files
          lspconfig = false,
          pathStrict = true,
        }
      end,
    },
    {
      "creativenull/efmls-configs-nvim",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = {
        "williamboman/mason.nvim"
      }
    },
    {
      "williamboman/mason.nvim",
      cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
      }, -- Package Manager
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "lukas-reineke/lsp-format.nvim",
      },
      config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        require("lspconfig.ui.windows").default_options.border = "rounded"

        local language_servers = {
          -- arduino
          "arduino_language_server",
          -- assembly
          "asm_lsp",
          -- astro
          "astro",
          -- awk
          "awk_ls",
          -- bash
          "bashls",
          -- c/c++
          "clangd",
          -- Cairo
          "cairo_ls",
          -- clojure
          "clojure_lsp",
          -- cmake
          "cmake",
          -- CSS
          "css_variables",
          "cssls",
          "tailwindcss",
          "unocss",
          -- Docker
          "docker_compose_language_service",
          "dockerls",
          -- Jinja
          "jinja_lsp",
          -- Elixer
          "elixirls",
          -- Emmet
          "emmet_language_server",
          -- Erlang
          "elp",
          -- Fortran
          "fortls",
          -- Go
          "gopls",
          "templ",
          -- Gradle
          "gradle_ls",
          -- GraphQL
          "graphql",
          -- Handlebars
          "glint",
          -- Helm
          "helm_ls",
          -- HTML
          "html",
          -- HTMX
          "htmx",
          -- Java
          "jdtls",
          -- JS
          "ts_ls",
          -- jq
          "jqls",
          -- JSON
          "jsonls",
          -- Jsonnet
          "jsonnet_ls",
          -- Julia
          "julials",
          -- Kotlin
          "kotlin_language_server",
          -- LaTeX
          "texlab",
          -- Liquid
          "shopify_theme_ls",
          -- Lua
          "lua_ls",
          -- Markdown
          "ltex",
          "marksman",
          -- Meason
          "mesonlsp",
          -- Nim
          "nim_langserver",
          -- Nix
          "rnix",
          -- OCaml
          "ocamllsp",
          -- OpenAPI
          "vacuum",
          -- OpenGL
          "glsl_analyzer",
          -- OpenSCAD
          "openscad_lsp",
          -- Perl
          "perlnavigator",
          -- PHP
          "intelephense",
          -- PowerShell
          "powershell_es",
          -- Prisma
          "prismals",
          -- Protobuf
          "buf_ls",
          -- Puppet
          "puppet",
          -- PureScript
          "purescriptls",
          -- reStructuredText
          "ltex",
          -- Ruby
          "ruby_lsp",
          -- Rust
          "rust_analyzer",
          -- Snyk
          "snyk_ls",
          -- SQL
          "sqlls",
          -- Svelte
          "svelte",
          -- Terraform
          "terraformls",
          "tflint",
          -- TOML
          "taplo",
          -- VimScript
          "vimls",
          -- Vue
          "vuels",
          -- YAML
          "yamlls",
          -- Zig
          "zls",
          -- EFM
          "efm",
          -- Typos
          "typos_lsp",
          -- Autotooling
          "autotools_ls",
          -- python
          "ruff",
          -- Static Type Analysis
          "ast_grep",
        }

        mason.setup({
          ui = {
            -- Whether to automatically check for new versions when opening the :Mason window.
            check_outdated_packages_on_open = true,
            border = "rounded",
            icons = {
              package_pending = " ",
              package_installed = " ",
              package_uninstalled = " ",
            },
          },
        })




        mason_lspconfig.setup({
          ensure_installed = language_servers,
          automatic_installation = true,
        })

        local disabled_servers = {
          "jdtls",
        }

        mason_lspconfig.setup_handlers {
          function(server_name)
            for _, name in pairs(disabled_servers) do
              if name == server_name then
                return
              end
            end
            local opts = {
              on_attach = require("plugins.lsp.handlers").on_attach,
              capabilities = require("plugins.lsp.handlers").capabilities,
            }

            local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
            if require_ok then
              opts = vim.tbl_deep_extend("force", server, opts)
            end

            lspconfig[server_name].setup(opts)
          end,
        }
      end,
    },
  },
}
