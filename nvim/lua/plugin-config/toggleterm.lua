--[[
Author       : UniMars
Date         : 2023-05-26 02:04:50
LastEditors  : UniMars
LastEditTime : 2023-05-26 02:14:54
Description  : file head
--]] local status, plugin = pcall(require, "toggleterm")
if not status then
    vim.notify("没有找到 toggleterm")
    return
end

local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = ""
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

-- local Terminal = require('toggleterm.terminal').Terminal
-- local pwsh = Terminal:new({
--     cmd = "pwsh",
--     direction = 'horizontal'
-- })

-- function _pwsh_toggle() pwsh:toggle() end

require("toggleterm").setup {
    open_mapping = [[<A-`>]],
    -- on_create = _pwsh_create('~'), -- function to run when the terminal is first created
    -- on_toggle = _pwsh_toggle(), -- function to run when the terminal is toggled
    -- 打开新终端后自动进入插入模式
    start_in_insert = true,
    -- 在当前buffer的下方打开新终端
    direction = 'horizontal'

}
