return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      'moll/vim-bbye'
    },
    config = function()
      require("bufferline").setup({
        options = {
          close_command = "Bdelete! %d",
        },
      })
      -- 键位映射
      vim.api.nvim_set_keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<C-w>", ":Bdelete!<CR>", { noremap = true, silent = true })
    end
  }
}
