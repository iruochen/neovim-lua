-- leader key 为空格
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- 复用 map 变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
map('n', '<LEADER>[', '<C-o>', opt)
map('n', '<LEADER>]', '<C-i>', opt)
-- 取消 s 默认功能
map('n', 's', '', opt)
-- S 保存
map('n', 'S', ':w<CR>', opt)
-- Q 退出
map('n', 'Q', ':q<CR>', opt)
map('n', 'QQ', ':q!<CR>', opt)
-- 支持在Visual模式下，通过C-y复制到系统剪切板
map('v', '<C-y>', '"+y', opt)
-- 支持在normal模式下，通过C-y复制到系统剪切板
map('n', '<C-y>', '"+y', opt)
-- 支持在normal模式下，通过C-p复制到系统剪切板
map('n', '<C-p>', '"*p', opt)
-- 上下滚动浏览
map('n', '<C-j>', '4j', opt)
map('n', '<C-k>', '4k', opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- ctrl+u / ctrl+d 是一对，ctrl+f / ctrl+b 是一对
map('n', '<C-u>', '9k', opt)
map('n', '<C-d>', '9j', opt)
-- 分屏快捷键
-- 向右分屏
map('n', 'sl', ':set splitright<CR>:vsplit<CR>', opt)
-- 向左分屏
map('n', 'sh', ':set nosplitright<CR>:vsplit<CR>', opt)
-- 向上分屏
map('n', 'sk', ':set nosplitbelow<CR>:split<CR>', opt)
-- 向下分屏
map('n', 'sj', ':set splitbelow<CR>:split<CR>', opt)
-- 分屏间移动映射
map('n', '<LEADER>l', '<C-w>l', opt)
map('n', '<LEADER>k', '<C-w>k', opt)
map('n', '<LEADER>h', '<C-w>h', opt)
map('n', '<LEADER>j', '<C-w>j', opt)
-- Leader CR 取消高亮
map('n', '<LEADER><CR>', ':nohlsearch<CR>', opt)
-- 映射L和H到行尾和行首
map('n', 'L', '$', opt)
map('n', 'H', '^', opt)
map('v', 'L', '$', opt)
map('v', 'H', '^', opt)
-- 映射;到:
map('n', ';', ':', opt)
-- insert 模式下光标移动
map('i', '<C-h>', '<Left>', opt)
map('i', '<C-l>', '<Right>', opt)
map('i', '<C-j>', '<Down>', opt)
map('i', '<C-k>', '<Up>', opt)
map('i', '<C-a>', '<Home>', opt)
map('i', '<C-e>', '<End>', opt)
map('i', '<C-d>', '<Delete>', opt)
-- jj 回到 normal 模式
map('i', 'jj', '<Esc>', opt)

-- visual模式下上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
