local status, cmp = pcall(require, 'cmp')
if not status then
  return
end
cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn['vsnip#anonymous'](args.body)

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
    -- 指定 snippet 引擎 luasnip
    --[[
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    ]]
    window = {
      completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
  },
  -- 补全源
  sources = cmp.config.sources({
    {
      name = 'luasnip',
      group_index = 1,
    },
    {
      name = 'nvim_lsp',
      group_index = 1,
    },
    {
      name = 'nvim_lsp_signature_help',
      group_index = 1,
    },
    {
      name = 'buffer',
      group_index = 2,
    },
    {
      name = 'path',
      group_index = 2,
    },
  }),
  -- 快捷键设置
  mapping = require('keybindings').cmp(cmp),
  -- 使用lspkind-nvim显示类型图标
  formatting = require('cmp.lspkind').formatting,
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
