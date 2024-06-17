return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    },
    flake8 = {
      enabled = true,
      ignore = { 'W391' },
      maxLineLength = 100
    },
  }
}
