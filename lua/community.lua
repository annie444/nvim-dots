-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- color scheme
  { import = "astrocommunity.colorscheme.dracula-nvim" },

  -- completion
  { import = "astrocommunity.completion.blink-cmp-emoji" },
  { import = "astrocommunity.completion.blink-cmp-git" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- editing support
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },

  -- fuzzy finder
  { import = "astrocommunity.fuzzy-finder.snacks-picker" },
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },

  -- git plugins
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gitgraph-nvim" },

  -- lsp
  { import = "astrocommunity.lsp.actions-preview-nvim" },

  -- lsp round 2
  { import = "astrocommunity.lsp.lsplinks-nvim" },

  -- Markdown + Latex
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- media
  { import = "astrocommunity.media.vim-wakatime" },

  -- move / motions
  { import = "astrocommunity.motion.mini-bracketed" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },

  -- NEOVIM
  { import = "astrocommunity.neovim-lua-development.helpview-nvim" },

  -- Extra support
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.programming-language-support.nvim-jqx" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },

  -- Astro Recipes
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.recipes.diagnostic-virtual-lines-current-line" },
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.recipes.neo-tree-dark" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },

  -- Remote Dev
  { import = "astrocommunity.remote-development.remote-sshfs-nvim" },

  -- Scrolling and Animations
  { import = "astrocommunity.scrolling.mini-animate" },

  -- Find and replace
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },

  -- Splits and Windows
  { import = "astrocommunity.split-and-window.neominimap-nvim" },
  { import = "astrocommunity.split-and-window.windows-nvim" },

  -- Terminal support
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.terminal-integration.nvim-unception" },

  -- Utilities
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.mason-tool-installer-nvim" },

  -- Testing
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.test.neotest" },
}
