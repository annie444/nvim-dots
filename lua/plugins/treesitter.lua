-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
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
      "latex",
      "norg",
      "typst",
    },
  },
}
