local status, plugin = pcall(require, "")
if not status then
  vim.notify("没有找到 ")
  return
end

require("").setup{

}
