local alpha = require("alpha")

local logo = [[
    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
]]


local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = vim.split(logo, "\n")

dashboard.section.buttons.val = {
  dashboard.button("SPC f f", "  Find Files"),
  dashboard.button("SPC f r", "󱔗  Recent Files"),
  dashboard.button("SPC f t", "󰈭  Find Text"),
  dashboard.button("SPC f p", "  Find Projects"),
  dashboard.button("SPC n f", "  Config Files", ":lua=config_files()<cr>"),
  dashboard.button("SPC n c", " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("SPC n l", "󰒲  Lazy", ":Lazy<CR>"),
  dashboard.button("SPC p u", "  Update Plugins"),
  dashboard.button("SPC q", "  Quit Neovim"),
}

for _, button in pairs(dashboard.section.buttons.val) do
  button.opts.hl = "AlphaButton"
  button.opts.hl_shortcut = "AlphaShortcut"
end

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  local lazy_ok, lazy = pcall(require, "lazy")
  if lazy_ok then
    local total_plugins = lazy.stats().count .. " Plugins"
    local startuptime = (math.floor(lazy.stats().startuptime * 100 + 0.5) / 100)
    return version .. "   " .. total_plugins .. "  󰄉 " .. startuptime .. " ms"
  else
    return version
  end
end

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    dashboard.section.footer.val = footer()
    vim.cmd "AlphaRedraw"
  end,
  desc = "Footer for Alpha",
})

dashboard.section.footer.opts.hl = "AlphaFooter"
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButton"
dashboard.opts.layout[1].val = 8

dashboard.opts.opts.noautocmd = false
alpha.setup(dashboard.opts)
