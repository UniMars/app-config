local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end


vim.opt.showmode = false

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'papercolor_light',
        globalstatus = true
    }
}
