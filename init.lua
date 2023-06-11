-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- Packer 插件管理
require('plugins')

------------ 插件配置 ---------------------
-- LSP
require('lsp.setup')
-- LSP 代码补全
require('lsp.cmp')
-- 括号匹配
require('plugin-config.indent-blankline')
-- 格式化代码
require('lsp.formatter')
-- require('lsp.null-ls')
-- neoai
require('plugin-config.neoai')
-- autopairs
require('plugin-config.nvim-autopairs')
------------ ------------------------------
