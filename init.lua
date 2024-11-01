-- 基础配置
require('basic')
-- 快捷键映射
require('keybindings')
-- lazy 插件管理
require('config.lazy')
_G.utils = require('utils')
-- 主题设置
vim.cmd.colorscheme('tokyonight')
