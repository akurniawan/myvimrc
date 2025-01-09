return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        prefer_git = true,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 
                    "c", "cpp", "cmake", "lua", "python", 
                    "rust", "vim", "vimdoc", "query" 
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }

            require('treesitter-context').setup {
                enable = true,
                max_lines = 0,
                min_window_height = 0,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = nil,
                zindex = 20,
            }
        end,
    }
}
