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

  function VimtexPDFToggle()
    if vim.g.term_pdf_vierer_open then
      vim.notify("Closing the pdf viewer", vim.log.levels.WARN)
      vim.system({ "kitty", "@", "close-window", "--match", "title:termpdf" })
      vim.g.term_pdf_vierer_open = false
    elseif vim.g.tex_compiles_successfully then
      vim.notify("Opening the pdf viewer", vim.log.levels.WARN)
      vim.system({ "kitty", "@", "launch", "--location=vsplit", "--cwd=current", "--title=termpdf" })

      local command = { "'", "conda", "activate", "neovim", "&&", "termpdf.py", vim.api.nvim_call_function("expand",
        { "%:r" }) .. ".pdf", "'\r'", "'" }
      local kitty = { "kitty", "@", "send-text", "--match", "title:termpdf" }
      vim.system(kitty .. command)
      vim.g.term_pdf_vierer_open = true
    end
  end

  -- Set the theme
  vim.cmd.colorscheme(name)
end
