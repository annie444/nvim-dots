return {
  "folke/which-key.nvim",
  module = true,
  cmd = "WhichKey",
  keys = "<leader>",
  config = function()
    local function toggle_distraction_free()
      if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
        if vim.o.cmdheight ~= 0 or vim.o.laststatus ~= 0 or vim.o.showtabline ~= 0 then
          vim.opt.cmdheight = 0
          vim.opt.laststatus = 0
          vim.opt.showtabline = 0
        else
          vim.opt.cmdheight = 1
          vim.opt.laststatus = 3
          vim.opt.showtabline = 2
        end
      end
    end

    local mappings = {
      { "<leader>r", ":%d+<cr>",              desc = "Remove All Text",  nowait = true, remap = false },
      { "<leader>y", ":%y+<cr>",              desc = "Yank All Text",    nowait = true, remap = false },
      { "<leader>e", ":Neotree toggle<cr>",   desc = "Explorer",         nowait = true, remap = false },
      { "<leader>D", toggle_distraction_free, desc = "Distraction Free", nowait = true, remap = false },
      { "<leader>q", ":qa!<cr>",              desc = "Quit",             nowait = true, remap = false },
      { "<leader>c", ":Bdelete!<cr>",         desc = "Close Buffer",     nowait = true, remap = false },
      { "<leader>T", ":TSContextToggle<cr>",  desc = "Toggle Context",   nowait = true, remap = false },
      {
        "<leader>mp",
        function()
          if vim.bo.filetype == "markdown" then
            vim.cmd "MarkdownPreviewToggle"
          else
            vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
          end
        end,
        desc = "Markdown Preview",
        nowait = true,
        remap = false,
      },

      { "<leader>p",  group = "Plugin",    nowait = true,        remap = false },
      { "<leader>pc", ":Lazy clean<cr>",   desc = "Clean",       nowait = true, remap = false },
      { "<leader>pC", ":Lazy check<cr>",   desc = "Check",       nowait = true, remap = false },
      { "<leader>pd", ":Lazy debug<cr>",   desc = "Debug",       nowait = true, remap = false },
      { "<leader>pi", ":Lazy install<cr>", desc = "Install",     nowait = true, remap = false },
      { "<leader>ps", ":Lazy sync<cr>",    desc = "Sync",        nowait = true, remap = false },
      { "<leader>pl", ":Lazy log<cr>",     desc = "Log",         nowait = true, remap = false },
      { "<leader>ph", ":Lazy home<cr>",    desc = "Home",        nowait = true, remap = false },
      { "<leader>pH", ":Lazy help<cr>",    desc = "Help",        nowait = true, remap = false },
      { "<leader>pp", ":Lazy profile<cr>", desc = "Profile",     nowait = true, remap = false },
      { "<leader>pu", ":Lazy update<cr>",  desc = "Update",      nowait = true, remap = false },

      { "<leader>n",  group = "Neovim",    nowait = true,        remap = false },
      { "<leader>nr", ":Reload<cr>",       desc = "Core Reload", nowait = true, remap = false },
      { "<leader>nu", ":Update<cr>",       desc = "Update",      nowait = true, remap = false },
      { "<leader>nm", ":messages<cr>",     desc = "Messages",    nowait = true, remap = false },
      { "<leader>nh", ":checkhealth<cr>",  desc = "Health",      nowait = true, remap = false },
      { "<leader>nv",
        function()
          local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
          return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
        end,
        "Version",
      },
      {
        "<leader>nc",
        config_files,
        desc = "Config Files",
        nowait = true,
        remap = false,
      },
      {
        "<leader>ni",
        function()
          if vim.fn.has "nvim-0.9.0" == 1 then
            vim.cmd "Inspect"
          else
            vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
          end
        end,
        desc = "Inspect",
        nowait = true,
        remap = false,
      },

      { "<leader>g",  group = "Git",                                   nowait = true,              remap = false },
      { "<leader>gj", ":lua require 'gitsigns'.next_hunk()<cr>",       desc = "Next Hunk",         nowait = true, remap = false },
      { "<leader>gk", ":lua require 'gitsigns'.prev_hunk()<cr>",       desc = "Prev Hunk",         nowait = true, remap = false },
      { "<leader>gl", ":lua require 'gitsigns'.blame_line()<cr>",      desc = "Blame",             nowait = true, remap = false },
      { "<leader>gp", ":lua require 'gitsigns'.preview_hunk()<cr>",    desc = "Preview Hunk",      nowait = true, remap = false },
      { "<leader>gr", ":lua require 'gitsigns'.reset_hunk()<cr>",      desc = "Reset Hunk",        nowait = true, remap = false },
      { "<leader>gR", ":lua require 'gitsigns'.reset_buffer()<cr>",    desc = "Reset Buffer",      nowait = true, remap = false },
      { "<leader>gs", ":lua require 'gitsigns'.stage_hunk()<cr>",      desc = "Stage Hunk",        nowait = true, remap = false },
      { "<leader>gu", ":lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk",   nowait = true, remap = false },
      { "<leader>go", ":Telescope git_status<cr>",                     desc = "Open changed file", nowait = true, remap = false },
      { "<leader>gb", ":Telescope git_branches<cr>",                   desc = "Checkout branch",   nowait = true, remap = false },
      { "<leader>gc", ":Telescope git_commits<cr>",                    desc = "Checkout commit",   nowait = true, remap = false },
      {
        "<leader>gd",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd "DiffviewOpen"
          else
            vim.cmd "DiffviewClose"
          end
        end,
        desc = "Toggle Diffview",
        nowait = true,
        remap = false,
      },
      {
        "<leader>gg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new { cmd = "lazygit" }
          lazygit:toggle()
        end,
        desc = "Lazygit",
        nowait = true,
        remap = false,
      },

      { "<leader>l",  group = "LSP",                                                                    nowait = true,                     noremap = true },
      { "<leader>lf", ":Format<cr>",                                                                    desc = "Format",                   nowait = true, remap = false },
      { "<leader>la", ":Lspsaga code_action<cr>",                                                       desc = "Code Action",              nowait = true, remap = false },
      { "<leader>li", ":LspInfo<cr>",                                                                   desc = "Info",                     nowait = true, remap = false },
      { "<leader>lo", ":Lspsaga outline<cr>",                                                           desc = "Code Outline",             nowait = true, remap = false },
      { "<leader>lI", ":Lspsaga incoming_calls<cr>",                                                    desc = "Incoming Calls",           nowait = true, remap = false },
      { "<leader>lO", ":Lspsaga outgoing_calls<cr>",                                                    desc = "Outgoing Calls",           nowait = true, remap = false },
      { "<leader>lm", ":Mason<cr>",                                                                     desc = "Mason Installer",          nowait = true, remap = false },
      { "<leader>lj", ":Lspsaga diagnostic_jump_next<cr>",                                              desc = "Next Diagnostic",          nowait = true, remap = false },
      { "<leader>lk", ":Lspsaga diagnostic_jump_prev<cr>",                                              desc = "Prev Diagnostic",          nowait = true, remap = false },
      { "<leader>lr", ":Lspsaga rename<cr>",                                                            desc = "Rename",                   nowait = true, remap = false },
      { "<leader>ld", ":Telescope diagnostics bufnr=0<cr>",                                             desc = "Document Diagnostics",     nowait = true, remap = false },
      { "<leader>lw", ":Telescope diagnostics<cr>",                                                     desc = "Workspace Diagnostics",    nowait = true, remap = false },
      { "<leader>ls", ":Telescope lsp_document_symbols<cr>",                                            desc = "Document Symbols",         nowait = true, remap = false },
      { "<leader>lS", ":Telescope lsp_workspace_symbols<cr>",                                           desc = "Workspace Symbols",        nowait = true, remap = false },

      { "<leader>f",  group = "Find",                                                                   nowait = true,                     remap = false },
      { "<leader>fa", ":Telescope autocommands<cr>",                                                    desc = "Autocommmands",            nowait = true, remap = false },
      { "<leader>ff", ":Telescope find_files<cr>",                                                      desc = "Files",                    nowait = true, remap = false },
      { "<leader>ft", ":Telescope live_grep<cr>",                                                       desc = "Text",                     nowait = true, remap = false },
      { "<leader>fT", ":TodoTelescope<cr>",                                                             desc = "Todo",                     nowait = true, remap = false },
      { "<leader>fB", ":Telescope bookmarks<cr>",                                                       desc = "Browswer Bookmarks",       nowait = true, remap = false },
      { "<leader>fb", ":Telescope buffers<cr>",                                                         desc = "Buffers",                  nowait = true, remap = false },
      { "<leader>fn", ":lua require('telescope').extensions.notify.notify()<cr>",                       desc = "Notify History",           nowait = true, remap = false },
      { "<leader>fc", ":Telescope colorscheme<cr>",                                                     desc = "Colorscheme",              nowait = true, remap = false },
      { "<leader>fp", ":Telescope projects<cr>",                                                        desc = "Projects",                 nowait = true, remap = false },
      { "<leader>fP", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview", nowait = true, remap = false },
      { "<leader>fs", ":Telescope persisted<cr>",                                                       desc = "Sessions",                 nowait = true, remap = false },
      { "<leader>fh", ":Telescope help_tags<cr>",                                                       desc = "Help",                     nowait = true, remap = false },
      { "<leader>fk", ":Telescope keymaps<cr>",                                                         desc = "Keymaps",                  nowait = true, remap = false },
      { "<leader>fC", ":Telescope commands<cr>",                                                        desc = "Commands",                 nowait = true, remap = false },
      { "<leader>fr", ":Telescope oldfiles<cr>",                                                        desc = "Recent Files",             nowait = true, remap = false },
      { "<leader>fH", ":Telescope highlights<cr>",                                                      desc = "Highlights",               nowait = true, remap = false },

      { "<leader>t",  group = "Terminal",                                                               nowait = true,                     remap = false },
      { "<leadertt",  ":ToggleTerm<cr>",                                                                desc = "Toggle",                   nowait = true, remap = false },
      { "<leaderth",  ":ToggleTerm size=10 direction=horizontal<cr>",                                   desc = "Horizontal",               nowait = true, remap = false },
      { "<leadertv",  ":ToggleTerm size=50 direction=vertical<cr>",                                     desc = "Vertical",                 nowait = true, remap = false },
      { "<leadertf",  ":ToggleTerm direction=float<cr>",                                                desc = "Float",                    nowait = true, remap = false },
      { "<leaderth",  ":ToggleTerm size=10 direction=horizontal<cr>",                                   desc = "Horizontal",               nowait = true, remap = false },
      { "<leadertv",  ":ToggleTerm size=50 direction=vertical<cr>",                                     desc = "Vertical",                 nowait = true, remap = false },
    }

    which_key_add(mappings, "n")
  end,
}
