-- This file can be loaded by calling `lua require('plugins')` from your init.vim
print('packer sss')
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- null ls
  use 'jose-elias-alvarez/null-ls.nvim'
  -- lua inspect
  use 'kikito/inspect.lua'
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	
	use { 'ibhagwan/fzf-lua',
		-- optional for icon support
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	-- Theme
	use { "catppuccin/nvim", as = "catppuccin" }
	use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		{run = ":TSUpdate"}
	}
	-- File tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}
	-- git
	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}
	-- sessions
	use {
		'rmagatti/auto-session'
	}
	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}
	-- Autoformat
	use 'lukas-reineke/lsp-format.nvim'

  -- Tabnine
  use { 'codota/tabnine-nvim', run = './dl_binaries.sh' }
  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- Crates for rust
  use {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
  }
end)
