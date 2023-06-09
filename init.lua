-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer 插件管理
require('plugins')
-- 主题设置
require('colorscheme')
------------ 插件配置 ---------------------
-- 侧边栏文件浏览器
require('plugin-config.nvim-tree')
-- 顶部标签页
require('plugin-config.bufferline')
-- 底部信息展示栏
require('plugin-config.lualine')
-- 模糊搜索
require('plugin-config.telescope')
-- 启动页
require('plugin-config.dashboard')
-- telescope project 扩展插件
require('plugin-config.project')
-- 高亮插件
require('plugin-config.nvim-treesitter')
-- LSP
require('lsp.setup')
-- LSP 代码补全
require('lsp.cmp')
-- LSP 错误提示
require('lsp.ui')
-- 括号匹配
require('plugin-config.indent-blankline')
-- 格式化代码
require('lsp.formatter')
-- neoai
require('plugin-config.neoai')
-- autopairs
require('plugin-config.nvim-autopairs')
------------ ------------------------------
