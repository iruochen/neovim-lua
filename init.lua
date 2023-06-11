-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer 插件管理
require('plugins')
-- 主题设置
require('colorscheme')

------------ 插件配置 ---------------------
-- LSP
require('lsp.setup')
-- LSP 代码补全
require('cmp.setup')
-- 格式化代码
require('format.setup')
------------ ------------------------------
