---@type LazySpec
return {
  -- customize dashboard options
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        win = {
          list = {
            wo = {
              wrap = true,
            },
          },
          preview = {
            wo = {
              wrap = true,
            },
          },
        },
      },
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "G",
              desc = "Lazygit",
              action = function()
                local astro = require "astrocore"
                local worktree = astro.file_worktree()
                local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir)
                  or ""
                astro.toggle_term_cmd { cmd = "lazygit " .. flags, direction = "float" }
              end,
            },
            {
              icon = " ",
              key = "D",
              desc = "Disk Usage",
              action = function()
                local astro = require "astrocore"
                local cmd = ""
                local dust = "dust"
                local du = "du"
                if vim.fn.executable(dust) ~= 1 then
                  cmd = dust
                elseif vim.fn.executable(du) ~= 1 then
                  cmd = du
                end
                if vim.fn.has "win32" == 1 then cmd = cmd .. ".exe" end
                astro.toggle_term_cmd { cmd = cmd, direction = "float" }
              end,
            },
            {
              icon = " ",
              key = "B",
              desc = "Resouce Usage",
              action = function()
                local astro = require "astrocore"
                astro.toggle_term_cmd { cmd = "btop", direction = "float" }
              end,
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          },
          header = [[
                                                    
 ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ 
 ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ 
 ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ 
 ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ 
 ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ 
 ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ 
                                                    ]],
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
          },
          { pane = 1, section = "keys", gap = 1, padding = 1 },
          { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              local Snacks = require "snacks"
              Snacks.gitbrowse()
            end,
          },
          function()
            local Snacks = require "snacks"
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Open Issues",
                cmd = "gh issue list -L 3",
                key = "i",
                action = function() vim.fn.jobstart("gh issue list --web", { detach = true }) end,
                icon = " ",
                height = 7,
              },
              {
                icon = " ",
                title = "Open PRs",
                cmd = "gh pr list -L 3",
                key = "P",
                action = function() vim.fn.jobstart("gh pr list --web", { detach = true }) end,
                height = 7,
              },
              {
                icon = " ",
                title = "Git Status",
                cmd = "git --no-pager diff --stat -B -M -C",
                height = 15,
              },
            }
            return vim.tbl_map(
              function(cmd)
                return vim.tbl_extend("force", {
                  pane = 2,
                  section = "terminal",
                  enabled = in_git,
                  padding = 1,
                  ttl = 5 * 60,
                  indent = 3,
                }, cmd)
              end,
              cmds
            )
          end,
          { section = "startup" },
        },
      },
    },
  },
}
