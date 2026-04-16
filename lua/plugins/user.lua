-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  { "Glench/Vim-Jinja2-Syntax", lazy = false },
  { "grafana/vim-alloy", lazy = false },
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
}
