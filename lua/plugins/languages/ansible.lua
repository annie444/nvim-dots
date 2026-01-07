---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      return require("astrocore").extend_tbl(opts, {
        filetypes = {
          pattern = {
            [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
            [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
            [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
            [".*/playbook.*%.ya?ml"] = "yaml.ansible",
            [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
            [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
            [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
            [".*/*ansible/.*%.ya?ml"] = "yaml.ansible",
          },
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ansible-lint" })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "ansible-lint", "ansible-language-server" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ansiblels" })
    end,
  },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
}
