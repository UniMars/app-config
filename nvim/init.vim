
"-----------------------------------------------"
""               设置                           "
"-----------------------------------------------"


"----------------插件---------------------------"
"filetype plugin on
filetype plugin indent on

" Packer插件管理
lua require('basic')
lua require('plugins')
lua require('autocmds')
lua require('keybindings')



"--------------------基础设置--------------------"
set encoding=utf-8
"set hidden                         " Hide buffers when they are abandoned
set mouse=a                         " Enable mouse usage (all modes)
set shell=pwsh
set clipboard^=unnamed,unnamedplus  "默认使用系统剪切板
set nocompatible                    "去除vi一致性
let g:python3_host_prog = 'D:\ProgramData\anaconda3\python.exe'
"-------------------显示设置--------------------"
set showmode                        "在底部显示，当前处于命令模式还是插入模式。
set showcmd                         "命令模式下，在底部显示，当前键入的指令
set number                          "显示行号
set relativenumber
set signcolumn=yes
set laststatus=2                    "是否显示状态栏 0不显示，1只在多窗口时显示，2显示
set ruler                           "在状态栏显示光标的当前位置（位于哪一行哪一列）
set showtabline=2                   "始终显示标签页
set cursorline                      "光标当前行高亮
syntax on                           "打开语法高亮。自动识别代码，使用多种颜色显示。
set background=dark
set termguicolors                   "启用终端真色
set t_Co=256
"colorscheme darkplus
set list                            "把制表符显示为^I ,用$标示行尾（使用list分辨尾部的字符是tab还是空格）
set listchars=space:⋅,trail:⋅
set fillchars+=vert:\|
set splitbelow
set splitright
set cc=120
set scrolloff=5

"-----------------代码缩进和排版-----------------"
set smartindent                     "智能缩进
set autoindent                      "按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致。
set smarttab
set tabstop=4                       "设置Tab宽度为4个空格
set shiftwidth=4                    "设定自动缩进为4个字符
set softtabstop=4
set expandtab                       "将制表符转换为空格
set backspace=indent,eol,start      "配置退格键删除制表符和空格
"set ambiwidth=double               "解决中文标点显示的问题
"set wrap                           "自动折行
set linebreak                       "只有遇到指定的符号（如空格连词号&其他标点）才折行=>不会在单词内部折行。
set showmatch           "光标遇到圆、方、大括号时，自动高亮对应的另一个括号。


"-----------------设置代码折叠-------------------"
set nofoldenable                    "启动 vim 时关闭折叠代码
" set foldmethod=expr                 "设置语法折叠
" setlocal foldlevel=99               "设置折叠层数
nnoremap ,, za                      "用空格键来开关折叠



"-------------------代码补全---------------------"
"set wildmenu
"set wildmode=longest:list,full
"命令模式下，底部操作指令按下 Tab键自动补全。
"第一次按下Tab，会显示所有匹配的操作指令的清单；
"第二次按下Tab，会依次选择各个指令。
"set completeopt=longest,menu        "自动补全配置让Vim补全菜单行为跟IDE一致


"-------------------搜索设置--------------------"
set hlsearch            "搜索时，高亮显示匹配结果。
set incsearch           "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果。
set ignorecase         "搜索时忽略大小写
set smartcase
"如果同时打开了ignorecase，那么对于只有一个大写字母的搜索词，将大小写敏感；
"其他情况都是大小写不敏感。比如，搜索Test时，将不匹配test；搜索test时，将匹配Test。


"-------------------文件设置--------------------"
set autowrite                       "Automatically save before commands like :next and :make
set autoread                        "打开文件自动检测外部更改
set undofile
set backupdir=~/.nvim/.backup//
set directory=~/.nvim/.swp//
set undodir=~/.nvim/.undo//


" netrw相关设置--------------------

let g:netrw_banner = 0          "设置是否显示横幅
let g:netrw_liststyle = 3       "设置目录列表的样式：树形
let g:netrw_browse_split = 2    "在之前的窗口编辑文件，类似按下大写 P
let g:netrw_altv = 1            "水平分割时，文件浏览器始终显示在左边
let g:netrw_winsize = 25        "设置文件浏览器窗口宽度为 25%



"-----------------------------------------------"
""               自定义功能                      "
"-----------------------------------------------"
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
" 当重新打开文件时跳转最后打开位置

" 定义跳出括号函数，用于跳出括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
" 将tab键绑定为跳出括号
" :inoremap <TAB> <c-r>=SkipPair()<CR>

"" 快捷键绑定-------------------------
"let mapleader=' '
" 窗口移动快捷键
noremap <TAB>w <C-w>w
noremap <TAB>W <C-w>W
noremap <TAB><left> <C-w><left>
noremap <TAB>h <C-w>h
noremap <TAB>H <C-w>H
noremap <TAB><right> <C-w><right>
noremap <TAB>l <C-w>l
noremap <TAB>L <C-w>L
noremap <TAB><up> <C-w><up>
noremap <TAB>k <C-w>k
noremap <TAB>K <C-w>K
noremap <TAB><down> <C-w><down>
noremap <TAB>j <C-w>j
noremap <TAB>J <C-w>J
" 使用方向键切换buffer
noremap <Leader><left> :bp<CR>
noremap <Leader><right> :bn<CR>
" 使用方括号切换tab
noremap <Leader>] :tabnext<CR>
noremap <Leader>[ :tabprevious<CR>
noremap <Leader>s :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>Q :qall<CR>
noremap <Leader>x :close<CR>

