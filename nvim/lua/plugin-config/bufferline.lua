--[[
Author       : UniMars
Date         : 2023-05-25 13:11:55
LastEditors  : UniMars
LastEditTime : 2023-05-25 23:36:47
Description  : file head
--]] local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("没有找到 bufferline")
    return
end
vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        mode = 'buffers',
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        close_command = "Bdelete! %d", -- can be a string | function, | false see "Mouse actions"
        right_mouse_command = "Bdelete! %d", -- can be a string | function | false, see "Mouse actions"
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            -- filetype = "CHADTree",
            text = "-------File Explorer-------",
            highlight = "Directory",
            text_align = "left"
        },{
            -- filetype
        }}
    },
    highlights = {
        indicator_selected = {
            fg = '#2980b9',
            sp = '#2980b9',
        },
        -- tab_separator_selected = {
        --     fg = '#f24f72',
        --     bg = '#f24f72',
        --     sp = '#f24f72'
        --     underline = #f24f72
        -- },
        buffer_selected = {
            fg = '#2980b9'
            -- bg = '#f24f72',
            -- underline = #f24f72
        }

    }
}
