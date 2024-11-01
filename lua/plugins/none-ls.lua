return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'jay-babu/mason-null-ls.nvim'
  },
  config = function()
    local tools = {
      "black"
    }
    require("mason-null-ls").setup({
      ensure_installed = tools,
      handlers = {},
    })
  end
}
