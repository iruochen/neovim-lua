# cmp 项目中配置
- 项目目录下创建 `.nvim.lua` 文件
- python 项目配置示例
```py
local dap = require('dap')
dap.adapters.debugpy = {
  type = 'executable',
  command = "python",
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'debugpy',
    request = 'launch',
    name = "Debuf Files",
    program = "${file}",
  },
  {
    type = 'debugpy',
    request = 'launch',
    name = "Debuf Files 2",
    program = "${file}",
  },
}
```
