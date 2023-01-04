-- Auto Install Packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

-- This is true if Packer is new
local packer_bootstrap = ensure_packer()

-- Reload Neovim and Installs/Updates/Removes Plugins after Save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync 
  augroup end
]])

-- Use Packer Safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- Add List of Plugins
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({ "nyoom-engineering/oxocarbon.nvim" })

	-- Transparent Plugin
	use({ "xiyaowong/nvim-transparent" })
	require("transparent").setup({
		enable = true,
		extra_groups = {
			"BufferLineTabClose",
			"BufferlineBufferSelected",
			"BufferLineFill",
			"BufferLineBackground",
			"BufferLineSeparator",
			"BufferLineIndicatorSelected",
		},
		exclude = {},
	})

	-- TMUX
	use("christoomey/vim-tmux-navigator")
	use("szw/vim-maximizer")

	-- Vim Essentials
	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Auto Commenting
	use("numToStr/Comment.nvim")

	-- File Explorer
	use("nvim-tree/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")

	-- Status Line
	use("nvim-lualine/lualine.nvim")

	-- Fuzzy Finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- Autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	-- Snippet engine
	use("hrsh7th/vim-vsnip")
	-- Adds extra functionality over rust analyzer
	use("simrat39/rust-tools.nvim")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- LSP Servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- Auto Closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Markdown Viewer
	use({ "ellisonleao/glow.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
