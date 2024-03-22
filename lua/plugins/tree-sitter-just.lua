return {
  "IndianBoy42/tree-sitter-just",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  setup = function()
    require('tree-sitter-just').setup({})
  end
}
