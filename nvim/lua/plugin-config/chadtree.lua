local status, chadtree= pcall(require, "chadtree")
if not status then
  vim.notify("没有找到 CHADTree")
  return
end

vim.keymap.set('n', '<leader>f', ":CHADopen<CR>",opt)
local chadtree_settings = {
    ['view.width']=30,
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
