if vim.g.vscode then
  require "core.options"
else
  local name = "nightly"

  require "core"
  require "plugin-loader"

  -- Check for theme configuration
  -- Theme configs are can be found on lua/plugins/theme
  pcall(require, "plugins.theme." .. name)

  vim.cmd [[
    set spell
    syntax enable
    filetype plugin indent on
    set modeline
    set modelines=5
  ]]

  -- Set the theme
  vim.cmd.colorscheme(name)
end
