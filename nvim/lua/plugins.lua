local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "git@github.com:folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath})
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
    git = {
        url_format = "git@github.com:%s.git"
    },
    checker = {
        -- automatically check for plugin updates
        enabled = true,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = false, -- get a notification when new updates are found
        frequency = 3600 -- check for updates every hour
    }
}

require("lazy").setup({ --
    ----------------------start--------------------------------
    "folke/lazy.nvim", --
    "folke/which-key.nvim", {
        "folke/neoconf.nvim",
        cmd = "Neoconf"
    }, --
    {"folke/neodev.nvim",lazy=true},--
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies={'HiPhish/nvim-ts-rainbow2'},
        config = function() require("plugin-config.treesitter") end

    },
    {"equalsraf/neovim-gui-shim"},--
    -------------------------- theme -------------------------------------------
    {
        "lunarvim/darkplus.nvim",
        lazy = false
        -- priority = 1000
        -- config = function()
        --   vim.cmd [[colorscheme darkplus]]
        -- end
    }, -- vscode theme
    {
        'joshdick/onedark.vim',
        lazy = false,
        priority = 1000
    }, -------------------------- plugins ----------------------------------------
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function() vim.cmd [[colorscheme darkplus]] end
    }, -- nvim图标
    ------------------------beautify
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        config = function() require('plugin-config.nvim-tree') end
    }, -- nvim-tree
    -- {
    --     'ms-jpq/chadtree',
    --     dependencies={'ryanoasis/vim-devicons','adelarsq/vim-emoji-icon-theme'},
    --     config = function() require('plugin-config.chadtree') end
    -- },--chadtree
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require('plugin-config.lualine') end

    }, -- lualine
    {
        'akinsho/bufferline.nvim',
        dependencies = {'famiu/bufdelete.nvim', 'nvim-tree/nvim-web-devicons'},
        config = function() require('plugin-config.bufferline') end
    }, -- bufferline
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require('plugin-config/indent-blankline') end
    }, -- indent line

    {
        'akinsho/toggleterm.nvim',
        config = function() require('plugin-config/toggleterm') end
    },--toggle term
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config =function () require('plugin-config.symbols-outline')end
        -- opts = {
        --     -- your configuration comes here
        --     -- or leave it empty to use the default settings
        --     -- refer to the configuration section below
        -- }
    },--todo highlight
    {'simrat39/symbols-outline.nvim',
    },
    ------------------------functional
    {
        'numToStr/Comment.nvim',
        config = function() require('plugin-config.comment') end
    },--comment
    {'jiangmiao/auto-pairs'},--auto pair
    {
        'neoclide/coc.nvim',
        branch='release',
        dependencies={'astoff/digestif'},
        config=function()require('plugin-config.coc')end
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        dependencies={
            'williamboman/mason-lspconfig.nvim',
            "neovim/nvim-lspconfig",
            'jose-elias-alvarez/null-ls.nvim',
            'mfussenegger/nvim-dap'
        },
        config=function ()require('plugin-config.mason')end
        -- :MasonUpdate updates registry contents
    }
}, lazy_config)
