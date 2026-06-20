-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    local get_icon = require("astroui").get_icon
    return require("astrocore").extend_tbl(opts or {}, {
      -- Configure core features of AstroNvim
      features = {
        large_buf = { enabled = true, size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
        autopairs = true, -- enable autopairs at start
        cmp = true, -- enable completion at start
        diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
        highlighturl = true, -- highlight URLs at start
        notifications = true, -- enable notifications at start
      },
      -- Enable git integration for detached worktrees
      git_worktrees = {
        { toplevel = vim.env.HOME, gitdir = vim.env.HOME .. "/.dotfiles" },
      },
      -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
      diagnostics = {
        virtual_text = true,
        underline = true,
      },
      -- passed to `vim.filetype.add`
      filetypes = {
        -- see `:h vim.filetype.add` for usage
        extension = {
          bats = "bash",
          pg = "sql",
        },
      },
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          relativenumber = true, -- sets vim.opt.relativenumber
          number = true, -- sets vim.opt.number
          spell = false, -- sets vim.opt.spell
          signcolumn = "yes", -- sets vim.opt.signcolumn to yes
          wrap = false, -- sets vim.opt.wrap
        },
        g = { -- vim.g.<key>
          -- configure global vim variables (vim.g)
          -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
          -- This can be found in the `lua/lazy_setup.lua` file
          ai_inline = true,
          ai_accept = nil,
        },
      },
      -- Mappings can be configured through AstroCore as well.
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {

        -- first key is the mode
        n = {
          ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<Leader>bd"] = {
            function()
              require("astroui.status.heirline").buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Close buffer from tabline",
          },
          ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
          ["<Leader>rb"] = {
            function() require("refactoring").refactor "Extract Block" end,
            desc = "Extract Block",
          },
          ["<Leader>ri"] = {
            function() require("refactoring").refactor "Inline Variable" end,
            desc = "Inline Variable",
          },
          ["<Leader>rp"] = {
            function() require("refactoring").debug.printf { below = false } end,
            desc = "Debug: Print Function",
          },
          ["<Leader>rc"] = {
            function() require("refactoring").debug.cleanup {} end,
            desc = "Debug: Clean Up",
          },
          ["<Leader>rd"] = {
            function() require("refactoring").debug.print_var { below = false } end,
            desc = "Debug: Print Variable",
          },
          ["<Leader>rbf"] = {
            function() require("refactoring").refactor "Extract Block To File" end,
            desc = "Extract Block To File",
          },
          ["<Leader>o"] = { desc = " Octo" },
          ["<leader>oi"] = {
            "<CMD>Octo issue list<CR>",
            desc = "List GitHub Issues",
          },
          ["<leader>op"] = {
            "<CMD>Octo pr list<CR>",
            desc = "List GitHub PullRequests",
          },
          ["<leader>od"] = {
            "<CMD>Octo discussion list<CR>",
            desc = "List GitHub Discussions",
          },
          ["<leader>on"] = {
            "<CMD>Octo notification list<CR>",
            desc = "List GitHub Notifications",
          },
          ["<leader>os"] = {
            function() require("octo.utils").create_base_search_command { include_current_repo = true } end,
            desc = "Search GitHub",
          },
        },

        x = {
          ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
          ["<Leader>re"] = {
            function() require("refactoring").refactor "Extract Function" end,
            desc = "Extract Function",
          },
          ["<Leader>rf"] = {
            function() require("refactoring").refactor "Extract Function To File" end,
            desc = "Extract Function To File",
          },
          ["<Leader>rv"] = {
            function() require("refactoring").refactor "Extract Variable" end,
            desc = "Extract Variable",
          },
          ["<Leader>ri"] = {
            function() require("refactoring").refactor "Inline Variable" end,
            desc = "Inline Variable",
          },
        },

        v = {
          ["<Leader>r"] = { desc = get_icon("Refactoring", 1, true) .. "Refactor" },
          ["<Leader>re"] = {
            function() require("refactoring").refactor "Extract Function" end,
            desc = "Extract Function",
          },
          ["<Leader>rf"] = {
            function() require("refactoring").refactor "Extract Function To File" end,
            desc = "Extract Function To File",
          },
          ["<Leader>rv"] = {
            function() require("refactoring").refactor "Extract Variable" end,
            desc = "Extract Variable",
          },
          ["<Leader>ri"] = {
            function() require("refactoring").refactor "Inline Variable" end,
            desc = "Inline Variable",
          },
          ["<Leader>rb"] = {
            function() require("refactoring").refactor "Extract Block" end,
            desc = "Extract Block",
          },
          ["<Leader>rbf"] = {
            function() require("refactoring").refactor "Extract Block To File" end,
            desc = "Extract Block To File",
          },
          ["<Leader>rr"] = {
            function() require("refactoring").select_refactor() end,
            desc = "Select Refactor",
          },
          ["<Leader>rp"] = {
            function() require("refactoring").debug.printf { below = false } end,
            desc = "Debug: Print Function",
          },
          ["<Leader>rc"] = {
            function() require("refactoring").debug.cleanup {} end,
            desc = "Debug: Clean Up",
          },
          ["<Leader>rd"] = {
            function() require("refactoring").debug.print_var { below = false } end,
            desc = "Debug: Print Variable",
          },
        },
      },
      treesitter = {
        highlight = true, -- enable/disable treesitter based highlighting
        indent = true, -- enable/disable treesitter based indentation
        auto_install = true, -- enable/disable automatic installation of detected languages
        ensure_installed = {
          "lua",
          "vim",
          "comment",
          "bibtex",
          "asm",
          "awk",
          "diff",
          "embedded_template",
          "fortran",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "git_config",
          "git_rebase",
          "gnuplot",
          "gpg",
          "http",
          "mermaid",
          "norg",
          "typst",
          "bash",
          "regex",
          "sql",
        },
      },
      autocmds = {
        autoformat_toggle = {
          -- Disable autoformat before saving
          {
            event = "User",
            desc = "Disable autoformat before saving",
            pattern = "AutoSaveWritePre",
            callback = function()
              -- Save global autoformat status
              vim.g.OLD_AUTOFORMAT = vim.g.autoformat
              vim.g.autoformat = false

              local old_autoformat_buffers = {}
              -- Disable all manually enabled buffers
              for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                if vim.b[bufnr].autoformat then
                  table.insert(old_autoformat_buffers, bufnr)
                  vim.b[bufnr].autoformat = false
                end
              end

              vim.g.OLD_AUTOFORMAT_BUFFERS = old_autoformat_buffers
            end,
          },
          -- Re-enable autoformat after saving
          {
            event = "User",
            desc = "Re-enable autoformat after saving",
            pattern = "AutoSaveWritePost",
            callback = function()
              -- Restore global autoformat status
              vim.g.autoformat = vim.g.OLD_AUTOFORMAT
              -- Re-enable all manually enabled buffers
              for _, bufnr in ipairs(vim.g.OLD_AUTOFORMAT_BUFFERS or {}) do
                vim.b[bufnr].autoformat = true
              end
            end,
          },
        },
      },
    })
  end,
}
