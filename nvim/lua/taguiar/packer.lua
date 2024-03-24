-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        config = function(_, _)
            local actions = require "telescope.actions"
            local telescope = require('telescope')
            local action_state = require 'telescope.actions.state'


            -- some code here
            telescope.setup {
                defaults = {
                    -- some code here
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next, -- works fine
                            ["<C-k>"] = actions.move_selection_previous, -- works fine
                            ["<c-a>"] = function()
                                print(vim.inspect(action_state.get_selected_entry)) -- it does nothing why ????
                            end,
                        }
                    }
                },
            }

        end,
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- use {
    --     'srcery-colors/srcery-vim', 
    --     as = 'srcery',
    --     config = function()
    --         vim.cmd('colorscheme srcery')
    --     end
    -- }


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        'xolox/vim-colorscheme-switcher',
        requires = {
            {'xolox/vim-misc'}
        }
    }

    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup_ts_grammar()
        require('orgmode').setup{}
    end
}

end)
