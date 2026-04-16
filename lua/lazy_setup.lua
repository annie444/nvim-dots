local debugging = false
local lazy_debug = vim.env.NVIM_LAZY_DEBUG
if lazy_debug ~= nil then
  lazy_debug = lazy_debug:lower()
  if lazy_debug == "1" or lazy_debug == "true" or lazy_debug == "yes" then debugging = true end
end

require("lazy").setup({
  {
    "AstroNvim/AstroNvim",
    version = "^6", -- Remove version tracking to elect for nightly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
      update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  lockfile = vim.fn.stdpath "config" .. "/lazy-lock.json",
  ---@type number? limit the maximum amount of concurrent tasks
  concurrency = jit.os:find "Windows"
      and (((vim.uv or vim.loop) and (vim.uv or vim.loop).available_parallelism)
        and ((vim.uv or vim.loop).available_parallelism() * 2) or nil)
    or nil,
  git = {
    -- defaults for the `Lazy log` command
    log = { "-8" }, -- show the last 8 commits
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    filter = true,
    throttle = { -- rate of network related git operations (clone, fetch, checkout)
      enabled = false, -- not enabled by default
    },
    cooldown = 3, -- Time in seconds to wait before running fetch again for a plugin.
  },
  pkg = {
    enabled = true,
    cache = vim.fn.stdpath "state" .. "/lazy/pkg-cache.lua",
    sources = { -- the first package source that is found for a plugin will be used.
      "lazy",
      "rockspec", -- will only be used when rocks.enabled is true
      "packspec",
    },
  },
  rocks = {
    enabled = true,
    root = vim.fn.stdpath "data" .. "/lazy-rocks",
    server = "https://lumen-oss.github.io/rocks-binaries/",
    -- use hererocks to install luarocks?
    -- set to `nil` to use hererocks when luarocks is not found
    -- set to `true` to always use hererocks
    -- set to `false` to always use luarocks
    hererocks = nil,
  },
  install = {
    missing = true,
    colorscheme = { "dracula" },
  },
  ui = { backdrop = 100 },
  headless = { -- Output options for headless mode
    process = true, -- show the output from process commands like git
    log = true, -- show log messages
    task = true, -- show task start/end
    colors = true, -- use ansi colors
  },
  checker = {
    enabled = true, -- automatically check for plugin updates
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  readme = {
    enabled = true,
    root = vim.fn.stdpath "state" .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true, -- only generate markdown helptags for plugins that don't have docs
  },
  state = vim.fn.stdpath "state" .. "/lazy/state.json", -- state info for checker and other things
  profiling = { -- Enable profiling of lazy.nvim.
    loader = debugging, -- Enables extra stats on the debug tab related to the loader cache.
    require = debugging, -- Track each new require in the Lazy profiling tab
  },
} --[[@as LazyConfig]])
