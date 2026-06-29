return {
  "nvim-neorg/neorg",
  version = "*",
  lazy = false,
  config = true,
  dependencies = {
    "nvim-neorg/tree-sitter-norg",
    "nvim-neorg/tree-sitter-norg-meta",
  },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.keybinds"] = {}, -- Adds default keybindings
        ["core.clipboard"] = {},
        ["core.clipboard.code-blocks"] = {},
        ["core.tangle"] = {},
        ["core.export"] = {},
        ["core.export.html"] = {},
        ["core.export.markdown"] = {},
        ["core.promo"] = {},
        ["core.itero"] = {},
        ["core.completion"] = {
          config = {
            engine = (astrocore.is_available "nvim-cmp" and "nvim-cmp"),
          },
        }, -- Enables support for completion plugins
        ["core.journal"] = {}, -- Enables support for the journal module
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Projects/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    })
  end,
}
