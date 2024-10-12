local M = {}

-- 重载某个模块
function M.reload(module)
  package.loaded[module] = nil
  require(module)
end

return M
