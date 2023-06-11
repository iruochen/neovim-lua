local packer = require('packer')
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')
    --------------------- colorschemes ---------------------
    -- tokyonight 主题
    use({
      'folke/tokyonight.nvim',
      config = function()
        require('plugin-config.tokyonight')
      end,
    })
    --------------------------------------------------------
    --------------------- plugins --------------------------
    -- nvim-tree 左侧文件树插件
    use({
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugin-config.nvim-tree')
      end,
    })
    -- bufferline 顶部标签页插件
    use({
      'akinsho/bufferline.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
      config = function()
        require('plugin-config.bufferline')
      end,
    })
    -- lualine 底部信息栏插件
    use({
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require('plugin-config.lualine')
      end,
    })
    -- use('arkav/lualine-lsp-progress')
    -- telescope 模糊搜索插件
    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        -- telescope extensions 可以列出环境变量
        { 'LinArcX/telescope-env.nvim' },
      },
      config = function()
        require('plugin-config.telescope')
      end,
    })
    -- dashboard-nvim 启动页插件
    use({
      'glepnir/dashboard-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('plugin-config.dashboard')
      end,
    })
    -- telescope project 插件
    use({
      'ahmedkhalf/project.nvim',
      config = function()
        require('plugin-config.project')
      end,
    })
    -- treesitter 语法高亮插件
    use({
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('plugin-config.nvim-treesitter')
      end,
    })
    -- indent-blankline(括号对齐线)
    use({
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugin-config.indent-blankline')
      end,
    })
    -- 括号自动补全
    use({
      'windwp/nvim-autopairs',
      config = function()
        require('plugin-config.nvim-autopairs')
      end,
    })
    -- markdown preview
    use({
      'iamcco/markdown-preview.nvim',
      run = function()
        vim.fn['mkdp#util#install']()
      end,
    })
    -- neoai
    use({
      'iruochen/neoai.nvim',
      requires = { 'MunifTanjim/nui.nvim' },
      config = function()
        require('plugin-config.neoai')
      end,
    })
    ------------------------LSP----------------------------
    -- installer
    use({ 'williamboman/mason.nvim' })
    use({ 'williamboman/mason-lspconfig.nvim' })
    -- Lspconfig
    use({ 'neovim/nvim-lspconfig' })
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- Snippet 引擎
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
    use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
    use('hrsh7th/cmp-path') -- { name = 'path' }
    use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
    use('hrsh7th/cmp-nvim-lsp-signature-help') -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use('rafamadriz/friendly-snippets')
    -- UI 增强
    use('onsails/lspkind-nvim')
    use('tami5/lspsaga.nvim')
    -- 代码格式化
    use('mhartington/formatter.nvim')
    use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
    -- TypeScript 增强
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
    use('jose-elias-alvarez/typescript.nvim')
    -- Lua 增强
    use('folke/neodev.nvim')
    -- JSON 增强
    use('b0o/schemastore.nvim')
    -- Rust 增强
    use('simrat39/rust-tools.nvim')
    -------------------------------------------------------
    -- git
    use({
      'lewis6991/gitsigns.nvim',
      config = function()
        require('plugin-config.gitsigns')
      end,
    })
  end,
  config = {
    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
--[=[
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
]=]
