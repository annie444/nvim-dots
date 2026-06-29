-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "NotAShelf/direnv.nvim",
    lazy = false,
    config = function()
      require("direnv").setup {
        bin = "direnv",
        autoload_direnv = false,
        notifications = {
          level = vim.log.levels.INFO,
          silent_autoload = false,
        },
      }
    end,
  },
  { "Glench/Vim-Jinja2-Syntax", lazy = false },
  { "grafana/vim-alloy", lazy = false },
  { "glacambre/firenvim", build = ":call firenvim#install(0)" },
  {
    "lalitmee/browse.nvim",
    cmd = { "Browse" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      provider = "google",
      bookmarks = {},
      bookmark_files = {
        vim.env.HOME .. "/.config/browse/bookmarks.yaml",
      },
      browser_bookmarks = {
        enabled = true,
        browsers = {
          chrome = false,
          firefox = true,
          safari = true,
          edge = false,
        },
        group_by_folder = true,
        auto_detect = false,
      },
      deduplicate_bookmarks = true,
      cache_bookmarks = true,
      cache_duration = 60,
      create_commands = true,
      themes = {
        browse = "dropdown",
        manual_bookmarks = "dropdown",
        browser_bookmarks = nil, -- nil uses the default Telescope theme
      },
      icons = {
        bookmark_alias = "->",
        bookmarks_prompt = "",
        grouped_bookmarks = "->",
        file_bookmark = "",
        browser_bookmark = "",
      },
      persist_grouped_bookmarks_query = false,
      bookmark_picker = {
        show_nested = true,
      },
      cache_pickers = 10,
      sort_results = true,
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    dependencies = { "DrKJeff16/wezterm-types" },
    opts_extend = { "library" },
    opts = {
      library = {
        { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      if not opts.keymap then opts.keymap = {} end
      opts.keymap["<Tab>"] = {
        "snippet_forward",
        function()
          if vim.g.ai_accept then return vim.g.ai_accept() end
        end,
        "fallback",
      }
      opts.keymap["<S-Tab>"] = { "snippet_backward", "fallback" }
    end,
  },
  {
    "rebelot/heirline.nvim",
    dependencies = {
      "AstroNvim/astroui",
    },
    opts = function(_, opts)
      local status = require "astroui.status"
      local path_func = status.provider.filename { modify = ":.:h", fallback = "" }

      opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }
      opts.tabline[2] = status.heirline.make_buflist(
        status.component.tabline_file_info { bufnr = { hl = status.hl.get_attributes "bufnr" } }
      )

      -- add time to last mode indicator
      opts.statusline[#opts.statusline] = status.component.builder {
        {
          provider = function()
            local time = os.date "%H:%M" -- show hour and minute in 24 hour format
            ---@cast time string
            return status.utils.stylize(time, {
              icon = { kind = "Clock", padding = { right = 1 } }, -- add icon
              padding = { right = 1 }, -- pad the right side
            })
          end,
        },
        update = { "ModeChanged", pattern = "*:*", callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end) },
        hl = status.hl.get_attributes "mode", -- highlight based on mode attributes
        surround = { separator = "right", color = status.hl.mode_bg }, -- background highlight based on mode
        init = status.init.update_events {
          { "User", pattern = "UpdateTime", callback = vim.schedule_wrap(function() vim.cmd.redrawstatus() end) },
        },
      }

      opts.winbar = { -- create custom winbar
        -- store the current buffer number
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false, -- pick the correct winbar based on condition
        -- inactive winbar
        {
          condition = function() return not status.condition.is_active() end,
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = path_func, padding = { left = 2 } },
          -- add the file name and icon
          status.component.file_info {
            file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        -- active winbar
        {
          -- show the path to the file relative to the working directory
          status.component.separated_path { path_func = path_func },
          -- add the file name and icon
          status.component.file_info { -- add file_info to breadcrumbs
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- show the breadcrumbs
          status.component.breadcrumbs {
            icon = { hl = true },
            hl = status.hl.get_attributes("winbar", true),
            prefix = true,
            padding = { left = 0 },
          },
        },
      }

      local uv = vim.uv or vim.loop
      uv.new_timer():start( -- timer for updating the time
        (60 - tonumber(os.date "%S")) * 1000, -- offset timer based on current seconds past the minute
        60000, -- update every 60 seconds
        vim.schedule_wrap(
          function() vim.api.nvim_exec_autocmds("User", { pattern = "UpdateTime", modeline = false }) end
        )
      )
    end,
  },
  {
    "okuuva/auto-save.nvim",
    event = { "User AstroFile", "InsertEnter" },
    opts = {
      condition = function(buf)
        if vim.tbl_contains({
          "Fyler",
        }, vim.fn.getbufvar(buf, "&filetype")) then return false end

        return true
      end,
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "sqlfluff" })
      opts.handlers = opts.handlers or {}

      opts.handlers.sqlfluff = function()
        local null_ls = require "null-ls"
        null_ls.register(null_ls.builtins.diagnostics.sqlfluff)
        null_ls.register(null_ls.builtins.formatting.sqlfluff)
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        sql = { "sqlfluff" },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed =
        require("astrocore").list_insert_unique(opts.ensure_installed, { "yamllint", "slint_lsp" })
    end,
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      -- or "fzf-lua" or "snacks" or "default"
      picker = "snacks",
      -- bare Octo command opens picker of commands
      enable_builtin = true,
      picker_config = {
        search_static = true, -- Whether to use static search results (true) or dynamic search (false)
        mappings = { -- mappings for the pickers
          open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
          copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
          copy_sha = { lhs = "<C-e>", desc = "copy commit SHA to system clipboard" },
          checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
          merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
        },
        snacks = { -- snacks specific config
          -- Initialize actions as empty arrays
          actions = { -- custom actions for specific snacks pickers (array of tables)
            issues = { -- actions for the issues picker
              -- { name = "my_issue_action", fn = function(picker, item) print("Issue action:", vim.inspect(item)) end, lhs = "<leader>a", desc = "My custom issue action" },
            },
            pull_requests = { -- actions for the pull requests picker
              -- { name = "my_pr_action", fn = function(picker, item) print("PR action:", vim.inspect(item)) end, lhs = "<leader>b", desc = "My custom PR action" },
            },
            notifications = {}, -- actions for the notifications picker
            issue_templates = {}, -- actions for the issue templates picker
            search = {}, -- actions for the search picker
            -- ... add actions for other pickers as needed
            changed_files = {},
            commits = {},
            review_commits = {},
          },
        },
        default_merge_method = "merge", -- default merge method which should be used for both `Octo pr merge` and merging from picker, could be `merge`, `rebase` or `squash`
        poll = {
          enabled = true, -- opt-in polling for remote changes
          interval = 10000, -- polling interval in milliseconds (default: 10s)
          notify_on_refresh = true, -- notify when a buffer is auto-refreshed
          notify_on_change = true, -- notify when remote changed but buffer has local edits
        },
        file_panel = {
          icons = function(name, _) return require("mini.icons").get("file", name) end,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "nvim-mini/mini.icons",
    },
  },
}
