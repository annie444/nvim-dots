return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      '<F4>',
      function()
        require("spectre").toggle()
      end,
      mode = { 'n' }
    },
  },
  config = function()
    require('spectre').setup({ is_block_ui_break = true })
  end,
}
