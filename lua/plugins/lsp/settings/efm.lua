local languages = {
  css = {
    require('efmls-configs.linters.stylelint'),
    require('efmls-configs.formatters.prettier'),
  },
  scss = {
    require('efmls-configs.linters.stylelint'),
    require('efmls-configs.formatters.prettier'),
  },
  less = {
    require('efmls-configs.linters.stylelint'),
    require('efmls-configs.formatters.prettier'),
  },
  sass = {
    require('efmls-configs.linters.stylelint'),
    require('efmls-configs.formatters.prettier'),
  },
  javascript = {
    require('efmls-configs.linters.eslint'),
    require('efmls-configs.formatters.prettier'),
  },
  javascriptreact = {
    require('efmls-configs.linters.eslint'),
    require('efmls-configs.formatters.prettier'),
  },
  typescript = {
    require('efmls-configs.linters.eslint'),
    require('efmls-configs.formatters.prettier'),
  },
  typescriptreact = {
    require('efmls-configs.linters.eslint'),
    require('efmls-configs.formatters.prettier'),
  },
  go = {
    require('efmls-configs.linters.golangci_lint'),
    require('efmls-configs.linters.golint'),
    require('efmls-configs.formatters.gofmt'),
  },
  html = {
    require('efmls-configs.linters.markuplint'),
    require('efmls-configs.formatters.prettier'),
  },
  lua = {
    require('efmls-configs.linters.luacheck'),
    require('efmls-configs.formatters.stylua'),
  },
  nix = {
    require('efmls-configs.formatters.alejandra'),
  },
  php = {
    require('efmls-configs.linters.phpcs'),
    require('efmls-configs.formatters.phpcbf'),
  },
  markdownlint = {
    require('efmls-configs.linters.markdownlint'),
    require('efmls-configs.formatters.mdformat'),
  },
  python = {
    require('efmls-configs.linters.ruff'),
    require('efmls-configs.formatters.black'),
    require('efmls-configs.formatters.ruff'),
    require('efmls-configs.formatters.ruff_sort'),
  },
  ruby = {
    require('efmls-configs.linters.reek'),
  },
  vim = {
    require('efmls-configs.linters.vint'),
  },
  blade = {
    require('efmls-configs.formatters.blade_formatter'),
  },
  proto = {
    require('efmls-configs.linters.buf'),
    require('efmls-configs.formatters.buf'),
  },
  misc = {
    require('efmls-configs.linters.codespell'),
    require('efmls-configs.linters.languagetool'),
  },
  json = {
    require('efmls-configs.linters.jq'),
    require('efmls-configs.formatters.jq'),
    require('efmls-configs.formatters.prettier'),
  },
  bash = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.beautysh'),
  },
  csh = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.beautysh'),
  },
  sh = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.beautysh'),
  },
  zsh = {
    require('efmls-configs.linters.shellcheck'),
    require('efmls-configs.formatters.beautysh'),
  },
  c = {
    require('efmls-configs.linters.gcc'),
    require('efmls-configs.formatters.clang_format'),
    require('efmls-configs.formatters.clang_tidy'),
  },
  ['c++'] = {
    require('efmls-configs.linters.gcc'),
    require('efmls-configs.formatters.clang_format'),
    require('efmls-configs.formatters.clang_tidy'),
  },
  fish = {
    require('efmls-configs.linters.fish'),
    require('efmls-configs.formatters.fish_indent'),
  },
  gitcommit = {
    require('efmls-configs.linters.gitlint'),
  },
  rust = {
    require('efmls-configs.formatters.rustfmt'),
  },
  sql = {
    require('efmls-configs.linters.sqlfluff'),
    require('efmls-configs.formatters.sql-formatter'),
  },
  terraform = {
    require('efmls-configs.formatters.terraform_fmt'),
  },
  yaml = {
    require('efmls-configs.formatters.yq'),
  },
  tex = {
    require('efmls-configs.linters.chktex'),
    require('efmls-configs.formatters.latexindent'),
  },
  toml = {
    require('efmls-configs.linters.taplo'),
  },
}

return {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}
