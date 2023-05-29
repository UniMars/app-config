-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = "\\"
-- vim.g.maplocalleader = ""

local opt = {
    noremap = true,
    silent = true,
}

local map = vim.api.nvim_set_keymap

map('i',"jkjk",         "<ESC>",opt)
map('i',"<C-s>",        "<ESC>:w<CR>",opt)
map('n',"<C-s>",        ":w<CR>",opt)
map('n', "<ESC>",       ":noh<CR>",opt)
map('v', "J",           ":m '>+1<CR>gv=gv",opt)
map('v', "<down>",      ":m '>+1<CR>gv=gv",opt)
map('v', "K",           ":m '<-2<CR>gv=gv",opt)
map('v', "<up>",        ":m '<-2<CR>gv=gv",opt)
map('n', "?",           ":WhichKey<CR>",opt)
map('n', "<C-`>",       ":WhichKey<CR>",opt)
map('n', "<A-q>",       ":q<CR>",opt)
-- bufferline 左右Tab--[[ 切换 ]]
map("n", "<C-h>",       ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-left>",    ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>",       ":BufferLineCycleNext<CR>", opt)
map("n", "<C-right>",   ":BufferLineCycleNext<CR>", opt)



-- NvimTree
-- empty setup using defaults
map('n', '<A-t>',   ":NvimTreeFindFileToggle<CR>", opt)

-- Bufferdelete
map('n', '<A-w>',       ":Bdelete<CR>", opt)  
