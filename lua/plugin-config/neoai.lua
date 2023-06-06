local status, bufferline = pcall(require, 'neoai')
if not status then
    vim.notify('没有找到 neoai')
    return
end
