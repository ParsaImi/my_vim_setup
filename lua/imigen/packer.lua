-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use "rose-pine/neovim"

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('nvim-lua/plenary.nvim')
	use ('ThePrimeagen/harpoon')
	use ('mbbill/undotree')
	use ("tpope/vim-fugitive")
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},             -- Required
			{'hrsh7th/cmp-nvim-lsp'},         -- Required
			{'hrsh7th/cmp-buffer'},           -- Optional
			{'hrsh7th/cmp-path'},             -- Optional
			{'saadparwaiz1/cmp_luasnip'},     -- Optional
			{'hrsh7th/cmp-nvim-lua'},         -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'},  -- Optional
		}
	}
	use 'ray-x/go.nvim'
  	use 'ray-x/guihua.lua'
    -- First, ensure you have a package manager (like packer.nvim or lazy.nvim)
-- If using packer, add this to your plugins section:
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true, -- Enable treesitter integration
                ts_config = {
                    lua = {'string'},  -- Don't add pairs in lua string treesitter nodes
                    javascript = {'template_string'}, -- Don't add pairs in javascript template_string
                    java = false,  -- Don't check treesitter on java
                },
                disable_filetype = { "TelescopePrompt", "vim" },
                enable_check_bracket_line = true, -- Don't add pairs if it already has a close pair in the same line
                ignored_next_char = "[%w%.]", -- Don't add pairs if the next char is alphanumeric
                fast_wrap = {
                    map = '<M-e>', -- Alt+e to wrap brackets
                    chars = { '{', '[', '(', '"', "'" },
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
                    end_key = '$',
                    keys = 'qwertyuiopzxcvbnmasdfghjkl',
                    check_comma = true,
                    highlight = 'Search',
                    highlight_grey='Comment'
                },
                -- Add custom rules
                custom_pairs = {
                    ["<"] = ">",
                    ["|"] = "|",
                    ["/**"] = "*/",
                },
            })

            -- If you want to automatically add `(` after select functions, eg: press function<cr> you get function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )

            -- Add spaces between parentheses (Optional)
            local Rule = require('nvim-autopairs.rule')
            local npairs = require('nvim-autopairs')

            npairs.add_rules({
                Rule(' ', ' ')
                    :with_pair(function (opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
                    end),
                Rule('( ', ' )')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%)') ~= nil
                    end)
                    :use_key(')'),
                Rule('{ ', ' }')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%}') ~= nil
                    end)
                    :use_key('}'),
                Rule('[ ', ' ]')
                    :with_pair(function() return false end)
                    :with_move(function(opts)
                        return opts.prev_char:match('.%]') ~= nil
                    end)
                    :use_key(']')
            })
        end
    }
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}
end)


