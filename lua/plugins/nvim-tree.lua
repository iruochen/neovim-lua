return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local on_attach = function()
      local api = require "nvim-tree.api"
      vim.keymap.set('n', 'tt', ':NvimTreeToggle<CR>', opts('Up'))
    end
    require("nvim-tree").setup {
    }
  end,
}
