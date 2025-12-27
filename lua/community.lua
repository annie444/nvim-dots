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
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  -- 12-26-2025: Disabled due to deprecated function calls in the plugin
  -- causing the tsserver LSP to crash.
  -- { import = "astrocommunity.lsp.ts-error-translator-nvim" },

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

  -- Packs
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.gleam" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.golangci-lint" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.wgsl" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.zig" },

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
