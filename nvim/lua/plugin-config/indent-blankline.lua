--[[
Author       : UniMars
Date         : 2023-05-26 01:02:25
LastEditors  : UniMars
LastEditTime : 2023-05-26 01:12:51
Description  : file head
--]]
local status, plugin = pcall(require, "indent_blankline")
if not status then
    vim.notify("没有找到 indent_blankline")
    return
end
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]
vim.g.indent_blankline_use_treesitter=true
vim.g.indent_blankline_show_current_context_start = true
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
    -- show_trailing_blankline_indent = false,

    space_char_blankline = " ",
    -- char = "",
    -- char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
    -- space_char_highlight_list = {
    --     "IndentBlanklineIndent1",
    --     "IndentBlanklineIndent2",
    -- },
}
