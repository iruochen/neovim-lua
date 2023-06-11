local status, db = pcall(require, 'dashboard')
if not status then
  vim.notify('没有找到 dashboard')
  return
end

db.setup({
  theme = 'doom',
  config = {
    -- ascii 图片生成网站
    -- http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=neovim
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],

      [[██████╗ ██╗   ██╗ ██████╗  ██████╗██╗  ██╗███████╗███╗   ██╗]],
      [[██╔══██╗██║   ██║██╔═══██╗██╔════╝██║  ██║██╔════╝████╗  ██║]],
      [[██████╔╝██║   ██║██║   ██║██║     ███████║█████╗  ██╔██╗ ██║]],
      [[██╔══██╗██║   ██║██║   ██║██║     ██╔══██║██╔══╝  ██║╚██╗██║]],
      [[██║  ██║╚██████╔╝╚██████╔╝╚██████╗██║  ██║███████╗██║ ╚████║]],
      [[╚═╝  ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]],
      [[]],
      [[]],
    },
    --[==[
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[          ▀████▀▄▄              ▄█ ]],
      [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
      [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
      [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
      [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
      [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
      [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
      [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
      [[   █   █  █      ▄▄           ▄▀   ]],
      [[]],
      [[]],
    },
    ]==]
    week_header = {
      append = true,
    },
    center = {
      {
        icon = '  ',
        desc = 'Projects                            ',
        action = 'Telescope projects',
        key = 'f',
      },
      {
        icon = '  ',
        desc = 'Recently files                      ',
        action = 'Telescope oldfiles',
        key = 'a',
      },
      {
        icon = '  ',
        desc = 'Edit keybindings                    ',
        action = 'edit ~/.config/nvim/lua/keybindings.lua',
        key = 'd',
      },
      {
        icon = '  ',
        desc = 'Edit Projects                       ',
        action = 'edit ~/.local/share/nvim/project_nvim/project_history',
        key = 'e',
      },
    },
  },
})
