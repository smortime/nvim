--- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    },

    -- Navigation
    {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- Session Manager
    {
        'rmagatti/auto-session',
    },

    -- Theme
    {
        'EdenEast/nightfox.nvim',
        -- config = function()
        --    vim.cmd.solorscheme 'nordfox'
        -- end,
    },

    {
        'shaunsingh/nord.nvim',
        -- config = function()
        --   vim.g.nord_italic = false
        --   vim.cmd.colorscheme 'nord'
        -- end,
    },

    -- Theme for sharing screen... easier to read
    {
        'folke/tokyonight.nvim',
        -- config = function()
        --	vim.cmd.colorscheme 'tokyonight-moon'
        -- end,
    },

    -- Whats the status capn'?
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            { 'kyazdani42/nvim-web-devicons', opt = true },
        }
    },

    -- Pls buff
    {
        'akinsho/bufferline.nvim',
        version = "*",
    },

    -- LET THERE BE LSP THAT WORKS
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- GO GO GADGET
    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },

    -- Rusty
    {
        'simrat39/rust-tools.nvim',
    },

    -- Elixir
    {
        "elixir-tools/elixir-tools.nvim",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local elixir = require("elixir")
            local elixirls = require("elixir.elixirls")

            elixir.setup {
                nextls = { enable = true },
                credo = {},
                elixirls = {
                    enable = true,
                    settings = elixirls.settings {
                        dialyzerEnabled = false,
                        enableTestLenses = false,
                    },
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
                        vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
                    end,
                }
            }
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

}, {})
