-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- AI
  { import = "astrocommunity.ai.copilotchat-nvim" },

  -- Bars and Lines
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },

  -- Code Runner
  { import = "astrocommunity.code-runner.overseer-nvim" },

  -- Colors
  { import = "astrocommunity.color.nvim-highlight-colors" },

  -- Color Scheme
  { import = "astrocommunity.colorscheme.dracula-nvim" },

  -- Completion
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.blink-cmp-emoji" },
  { import = "astrocommunity.completion.blink-copilot" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- Editing Support
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- Fuzzy Finder
  { import = "astrocommunity.fuzzy-finder.snacks-picker" },

  -- Git
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gitgraph-nvim" },

  -- Icons
  { import = "astrocommunity.icon.mini-icons" },

  -- LSP
  { import = "astrocommunity.lsp.lsplinks-nvim" },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.lsp.nvim-lint" },

  -- Markdown + Latex
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- Media
  { import = "astrocommunity.media.vim-wakatime" },

  -- Move / Motions
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-basics" },
  { import = "astrocommunity.motion.mini-bracketed" },
  { import = "astrocommunity.motion.mini-jump" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.flash-nvim" },

  -- Neovim
  { import = "astrocommunity.neovim-lua-development.helpview-nvim" },

  -- Language Packs
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.astro" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.eslint" },
  { import = "astrocommunity.pack.fish" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.golangci-lint" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.julia" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.mdx" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.nushell" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.prettier" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.proto" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.python.ty" },
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.templ" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.toml" },
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
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.telescope-nvim-snacks" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.recipes.vscode" },

  -- Scrolling and Animations
  { import = "astrocommunity.scrolling.mini-animate" },

  -- Find and replace
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.search.nvim-hlslens" },

  -- Splits and Windows
  { import = "astrocommunity.split-and-window.minimap-vim" },

  -- Terminal support
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.terminal-integration.nvim-unception" },

  -- Testing
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.test.neotest" },

  -- Utilities
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.mason-tool-installer-nvim" },
  { import = "astrocommunity.utility.vim-fetch" },
}
