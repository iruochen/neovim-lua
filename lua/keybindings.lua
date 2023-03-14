-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- 复用 map 变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
-- 取消 s 默认功能
map("n", "s", "", opt)
-- S 保存
map("n", "S", ":w<CR>", opt)
-- Q 退出
map("n", "Q", ":q<CR>", opt)
map("n", "QQ", ":q!<CR>", opt)
-- 支持在Visual模式下，通过C-y复制到系统剪切板
map("v", "<C-y>", '"+y', opt)
-- 支持在normal模式下，通过C-y复制到系统剪切板
map("n", "<C-y>", '"+y', opt)
-- 支持在normal模式下，通过C-p复制到系统剪切板
map("n", "<C-p>", '"*p', opt)
-- 分屏快捷键
-- 向右分屏
map("n", "sl", ":set splitright<CR>:vsplit<CR>", opt)
-- 向左分屏
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>", opt)
-- 向上分屏
map("n", "sk", ":set nosplitbelow<CR>:split<CR>", opt)
-- 向下分屏
map("n", "sj", ":set splitbelow<CR>:split<CR>", opt)
-- 分屏间移动映射
map("n", "<LEADER>l", "<C-w>l", opt)
map("n", "<LEADER>k", "<C-w>k", opt)
map("n", "<LEADER>h", "<C-w>h", opt)
map("n", "<LEADER>j", "<C-w>j", opt)

-- 插件快捷键
local pluginKeys = {}
-- nvim-tree
-- tt 键打开关闭tree
map("n", "tt", ":NvimTreeToggle<CR>", opt)
-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
return pluginKeys
