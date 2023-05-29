local function float_window(textlist)
    -- 创建一个包含一些文本的缓冲区
    local buf = vim.api.nvim_create_buf(false, true)

    -- 在缓冲区中设置一些文本
    vim.api.nvim_buf_set_lines(buf, 0, -1, false,textlist)

    -- 设置窗口的参数
    local width = 100
    local height = 10
    local opts = {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = "rounded"
    }

    -- 创建一个新的浮动窗口，显示我们刚刚创建的缓冲区
    local win = vim.api.nvim_open_win(buf, true, opts)

    -- 设定浮动窗口的语法高亮
    vim.api.nvim_win_set_option(win, 'winhl', 'Normal:MyFloat')
end

local status, bufferline = pcall(require, "nvim-tree")
if not status then
  vim.notify("没有找到 nvim-tree")
  return
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true



vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})


local function open_nvim_tree(data)

    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1
    -- buffer is a [No Name]
    local buftype=vim.bo[data.buf].buftype
    local filetype=vim.bo[data.buf].ft
    local no_name = data.file == "" and buftype == ""
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    -- float_window({tostring(buftype),tostring(filetype),tostring(directory),tostring(real_file),tostring(no_name),'1'..data.file})
    if directory then
        -- open the tree
        -- vim.api.cmd('buffer '..data.buf)
        -- create a new, empty buffer
        vim.cmd.enew()
        -- wipe the directory buffer
        vim.cmd.bw(data.buf)
        -- change to the directory
        vim.cmd.cd(data.file)
        require("nvim-tree.api").tree.open()
    elseif buftype=='nofile'then
        vim.cmd.enew()
        require("nvim-tree.api").tree.toggle({
            focus=true
        })
        require("nvim-tree.api").tree.open()
        vim.api.nvim_command('wincmd l')
    elseif real_file then
        filepath=data.file:match("(.*[/\\]).-")
        -- float_window({data.file,filepath,tostring(real_file),tostring(no_name),tostring(directory)})
        -- open the tree, find the file but don't focus it
        require("nvim-tree.api").tree.toggle({
            focus=true,
            find_file = true,
            update_root=true
        })
        require('nvim-tree.api').tree.change_root(filepath)
        vim.api.nvim_command('wincmd l')
    elseif no_name then
        require("nvim-tree.api").tree.toggle({ focus = true, find_file = true, })
        vim.api.nvim_command('wincmd l')
    else
        return
    end
end



vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = open_nvim_tree
})


require'nvim-tree'.setup {
   actions={
        open_file={
           quit_on_open=false
        }
   },
    -- 不显示 git 状态图标
    git = {
        enable = false
    }     
}
-- vim.cmd("NvimTreeToggle")
