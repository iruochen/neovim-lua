-- leader key 为空格
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- 复用 map 变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
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
map('n', '<LEADER><CR>', ':nohlsearch', opt)
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

-- 插件快捷键
local pluginKeys = {}
------------------- nvim-tree--------------------------
-- tt 键打开关闭tree
map('n', 'tt', ':NvimTreeToggle<CR>', opt)
------------------ ------------------------------------
------------------ bufferline -------------------------
-- 左右Tab切换
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)
-- 关闭
--"moll/vim-bbye"
map('n', '<C-w>', ':Bdelete!<CR>', opt)
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)
------------------ ------------------------------------
------------------ Telescope --------------------------
-- 查找文件
map('n', '<leader>p', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<leader>f', ':Telescope live_grep<CR>', opt)

------------------ ------------------------------------
---------------------- NeoAI --------------------------
-- normal模式
map('n', 'ai', ':NeoAI<CR>', opt)
------------------ ------------------------------------

------------- Telescope 列表插入模式快捷键-------------
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ['<C-j>'] = 'move_selection_next',
    ['<C-k>'] = 'move_selection_previous',
    ['<Down>'] = 'move_selection_next',
    ['<Up>'] = 'move_selection_previous',
    -- 历史记录
    ['<C-n>'] = 'cycle_history_next',
    ['<C-p>'] = 'cycle_history_prev',
    -- 关闭窗口
    ['<C-c>'] = 'close',
    -- 预览窗口上下滚动
    ['<C-u>'] = 'preview_scrolling_up',
    ['<C-d>'] = 'preview_scrolling_down',
  },
}
------------------ ------------------------------------

----------------- comment 代码注释插件 ----------------
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = 'gcc', -- 行注释
    block = 'gbc', -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = 'gc',
    bock = 'gb',
  },
}
-- ctrl + /
map('n', '<C-/>', 'gcc', { noremap = false })
map('v', '<C-/>', 'gb', { noremap = false })
-------------------------------------------------------

----------------- nvim-tree 列表快捷键 ----------------
--[[
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
  -- 分屏打开文件
  { key = 'v', action = 'vsplit' },
  { key = 'h', action = 'split' },
  -- 显示隐藏文件
  { key = 'i', action = 'toggle_custom' }, -- 对应 filters 中的 custom (node_modules)
  { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
  -- 文件操作
  { key = '<F5>', action = 'refresh' },
  { key = 'a', action = 'create' },
  { key = 'd', action = 'remove' },
  { key = 'r', action = 'rename' },
  { key = 'x', action = 'cut' },
  { key = 'c', action = 'copy' },
  { key = 'p', action = 'paste' },
  { key = 's', action = 'system_open' },
}
]]
pluginKeys.nvim_tree_on_attach = function(bufnr)
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- 打开文件或文件夹
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  -- 分屏打开文件
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  -- 显示隐藏文件
  vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  -- 刷新
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
end

-------------------------------------------------------
---------------- LSP 回调函数快捷键设置----------------
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  --]]
  mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
  -- code action
  --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  --]]
  mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
  -- go xx
  --[[
    mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
  --]]
  mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
  --[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  --]]
  mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
  --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
  mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
  --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  --]]
  -- diagnostic
  mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
  mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
  mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
  if vim.fn.has('nvim-0.8') == 1 then
    mapbuf('n', '<C-,>', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>')
  else
    mapbuf('n', '<C-,>', '<cmd>lua vim.lsp.buf.formatting()<CR>')
  end
  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
-------------------------------------------------------
---------------- nvim-cmp 自动补全 --------------------
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end
  return {
    -- 出现补全
    ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    -- 取消
    ['<A-,>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 上一个
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- 下一个
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- 确认
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- 如果窗口内容太多，可以滚动
    ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    -- 自定义代码段跳转到下一个参数
    ['<C-l>'] = cmp.mapping(function(_)
      if vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      end
    end, { 'i', 's' }),

    -- 自定义代码段跳转到上一个参数
    ['<C-h>'] = cmp.mapping(function()
      if vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' }),

    -- Super Tab
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' }),
    -- end of super Tab
  }
end
-------------------------------------------------------
return pluginKeys
