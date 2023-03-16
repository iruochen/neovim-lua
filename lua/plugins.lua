local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim'
    --------------------- colorschemes ---------------------
    -- tokyonight 主题
    use("folke/tokyonight.nvim")
    --------------------------------------------------------
    --------------------- plugins --------------------------
    -- nvim-tree 左侧文件树插件
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
    -- bufferline 顶部标签页插件
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine 底部信息栏插件
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    -- telescope 模糊搜索插件
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- telescope extensions 可以列出环境变量
    use "LinArcX/telescope-env.nvim"
    -- dashboard-nvim 启动页插件
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          -- config
        }
      end,
      requires = {'nvim-tree/nvim-web-devicons'}
    }
    -- telescope project 插件
    use("ahmedkhalf/project.nvim")
    -- treesitter 语法高亮插件
    use({ "nvim-treesitter/nvim-treesitter" })
    -------------------------------------------------------
  end,
  config = {
    -- 以浮动窗口打开安装列表
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
  }
})
