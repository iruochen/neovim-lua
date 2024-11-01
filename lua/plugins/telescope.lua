return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'airblade/vim-rooter'
  },
  -- cmd/key: 输入该命令后才去加载插件
  cmd = "Telescope",
  keys = {
    { '<leader>?',       "<cmd>lua require('telescope.builtin').oldfiles()<cr>" },
    { "<leader>p",       ":Telescope find_files<CR>",                           desc = "find files" },
    { "<leader>f",       ":Telescope live_grep<CR>",                            desc = "grep files" },
    { "<leader>rs",      ":Telescope resume<CR>",                               desc = "resume" },
    { "<leader><space>", ":Telescope buffers<CR>",                              desc = "resume" },
    { "<leader>q",       ":Telescope oldfiles<CR>",                             desc = "oldfiles" },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = { ".git", "node_modules" }
      }
    })
  end
}
