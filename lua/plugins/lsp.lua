-- 参考配置：https://github.com/FledgeXu/NeovimZero2Hero/blob/main/lua/plugins/lsp.lua
return {
  -- 用于配置lsp, 可以在项目lua/lspconfig/configs下看到大量配置文件
  "neovim/nvim-lspconfig",
  cmd = { "Mason", "Neoconf" },
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- 用于安装lsp
    "williamboman/mason.nvim",
    -- 快捷配置lsp
    "williamboman/mason-lspconfig",
    -- 识别全局变量 vim
    "folke/neodev.nvim",
    -- 右下角显示lsp进度
    "j-hui/fidget.nvim",
    -- lsp ui美化
    "nvimdev/lspsaga.nvim",
  },
  config = function()
    local servers = {
      lua_ls = {
        settings = {
          -- ls特殊配置
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        }
      },
      pyright = {},
      jsonls = {},
      volar = {},
      dockerls = {},
      docker_compose_language_service = {},
      bashls = {},
    }
    local on_attach = function(_, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      local vmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      nmap('gd', require "telescope.builtin".lsp_definitions, '[G]oto [D]efinition')
      -- nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('K', "<cmd>Lspsaga hover_doc<CR>", 'Hover Documentation')
      -- nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
      nmap('gi', require "telescope.builtin".lsp_implementations, '[G]oto [I]mplementation')
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')
      nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
      -- nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>rn', "<cmd>Lspsaga rename ++project<cr>", '[R]e[n]ame')
      -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      nmap('<leader>ca', "<cmd>Lspsaga code_action<CR>", '[C]ode [A]ction')
      nmap('<leader>da', require "telescope.builtin".diagnostics, '[D]i[A]gnostics')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      -- nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
      vmap("=", function()
        vim.lsp.buf.format { async = true }
      end, "[F]ormat code")
      nmap("==", function()
        vim.lsp.buf.format { async = true }
      end, "[F]ormat code")
    end
    require("neodev").setup()
    require("fidget").setup({})
    require("lspsaga").setup()
    require("mason").setup()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(servers),
    })

    for server, config in pairs(servers) do
      require("lspconfig")[server].setup(
        vim.tbl_deep_extend("keep",
          {
            on_attach = on_attach,
            capabilities = capabilities
          },
          config
        )
      )
    end
  end
}
