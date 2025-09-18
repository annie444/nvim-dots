-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure auto commands
    autocmds = {
      -- first key is the `augroup` (:h augroup)
      highlighturl = {
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "VimEnter", "FileType", "BufEnter", "WinEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "URL Highlighting",
          callback = function() require("astrocore").set_url_match() end,
        },
      },
    },
    -- Configure user commands
    commands = {
      -- key is the command name
      AstroReload = {
        -- first element with no key is the command (string or function)
        function() require("astrocore").reload() end,
        -- the rest are options for creating user commands (:h nvim_create_user_command)
        desc = "Reload AstroNvim (Experimental)",
      },
    },
    -- Diagnostics configuration (`:h vim.diagnostic.config()`) when diagnostics are on
    diagnostics = {
      underline = true,
      virtual_text = true,
      virtual_lines = true,
      signs = true,
      float = true,
      update_in_insert = true,
      severity_sort = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {},
    -- Configuration of vim mappings to create
    mappings = {
      -- map mode (:h map-modes)
      n = {
        ["<leader>um"] = { ":Neominimap Toggle<cr>", desc = "Toggle the minimap" },
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
      },
    },
    -- Configure functions on key press
    -- Takes a table with arbitrary keys that map to a list of functions to execute on key press
    on_keys = {},
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = true, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        guifont = "JetBrainsMono Nerd Font Mono:h12", -- sets vim.opt.guifont
      },
    },
    -- Configure core features of AstroNvim
    features = {
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      large_buf = { -- set global limits for large files for disabling features like treesitter
        notify = true,
        size = 1024 * 100,
        lines = 10000,
        line_length = 1000,
      },
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Configure project root detection, check status with `:AstroRootInfo`
    rooter = {
      -- list of detectors in order of prevalence, elements can be:
      --   "lsp" : lsp detection
      --   string[] : a list of directory patterns to look for
      --   fun(bufnr: integer): string|string[] : a function that takes a buffer number and outputs detected roots
      detector = {
        "lsp", -- highest priority is getting workspace from running language servers
        { ".git", "_darcs", ".hg", ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "lua", "MakeFile", "package.json" }, -- lastly check for known project root files
      },
      -- ignore things from root detection
      ignore = {
        servers = {}, -- list of language server names to ignore (Ex. { "efm" })
        dirs = {}, -- list of directory patterns (Ex. { "~/.cargo/*" })
      },
      -- automatically update working directory (update manually with `:AstroRoot`)
      autochdir = false,
      -- scope of working directory to change ("global"|"tab"|"win")
      scope = "global",
      -- show notification on every working directory change
      notify = false,
    },
    sessions = {},
  },
}
