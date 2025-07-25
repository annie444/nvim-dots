-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- bars and lines
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },

  -- code runner
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.code-runner.compiler-nvim" },

  -- color
  { import = "astrocommunity.color.nvim-highlight-colors" },
  { import = "astrocommunity.color.vim-highlighter" },

  -- color scheme
  { import = "astrocommunity.colorscheme.dracula-nvim" },

  -- comments
  { import = "astrocommunity.comment.mini-comment" },

  -- completion
  { import = "astrocommunity.completion.cmp-calc" },
  { import = "astrocommunity.completion.cmp-latex-symbols" },
  { import = "astrocommunity.completion.cmp-nerdfont" },
  { import = "astrocommunity.completion.cmp-nvim-lua" },
  { import = "astrocommunity.completion.cmp-spell" },
  { import = "astrocommunity.completion.blink-cmp" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- debugging
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },

  -- diagnostics
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- editing support
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.editing-support.hypersonic-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  { import = "astrocommunity.editing-support.nvim-treesitter-context" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.vim-doge" },
  { import = "astrocommunity.editing-support.wildfire-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },

  -- fuzzy finder
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  { import = "astrocommunity.fuzzy-finder.snacks-picker" },

  -- git plugins
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gitgraph-nvim" },

  -- indent
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.indent-tools-nvim" },

  -- keybindings
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  -- lsp
  { import = "astrocommunity.lsp.dev-tools-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.lsp.lsp-lens-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.lsp.nvim-lsp-file-operations" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  -- lsp round 2
  { import = "astrocommunity.lsp.delimited-nvim" },
  { import = "astrocommunity.lsp.lsplinks-nvim" },

  -- Markdown + Latex
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markview-nvim" },

  -- media
  { import = "astrocommunity.media.img-clip-nvim" },
  { import = "astrocommunity.media.vim-wakatime" },

  -- move / motions
  { import = "astrocommunity.motion.mini-ai" },
  { import = "astrocommunity.motion.mini-basics" },
  { import = "astrocommunity.motion.mini-bracketed" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.leap-nvim" },

  -- NEOVIM
  { import = "astrocommunity.neovim-lua-development.helpview-nvim" },

  -- Notes
  { import = "astrocommunity.note-taking.venn-nvim" },

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
  { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
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
  { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.programming-language-support.web-tools-nvim" },

  -- Astro Recipes
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity.recipes.heirline-clock-statusline" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.recipes.ai" },
  { import = "astrocommunity.recipes.diagnostic-virtual-lines-current-line" },
  { import = "astrocommunity.recipes.auto-session-restore" },
  { import = "astrocommunity.recipes.cache-colorscheme" },
  { import = "astrocommunity.recipes.neo-tree-dark" },
  { import = "astrocommunity.recipes.picker-lsp-mappings" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.telescope-nvim-snacks" },
  { import = "astrocommunity.recipes.vscode" },

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

  -- Syntax editing
  { import = "astrocommunity.syntax.vim-easy-align" },

  -- Terminal support
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  { import = "astrocommunity.terminal-integration.nvim-unception" },

  -- Utilities
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.utility.mason-tool-installer-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.vim-fetch" },

  -- Testing
  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.test.neotest" },

  -- Registers
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  { import = "astrocommunity.registers.vim-obsession" },

  -- Snippets
  { import = "astrocommunity.snippets.nvim-snippets" },
}
