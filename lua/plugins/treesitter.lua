-- Customize Treesitter

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
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
      },
    },
  },
}
