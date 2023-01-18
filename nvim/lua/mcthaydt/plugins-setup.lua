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

	
  use ({"neoclide/coc.nvim", branch = "release"})

	-- Treesitter
  use {
  'nvim-treesitter/nvim-treesitter',
  commit = '9bfaf62e42bdcd042df1230e9188487e62a112c0',
  }

  -- Rust
  use 'rust-lang/rust-analyzer'
  use 'dense-analysis/ale'
  use 'rust-lang/rust.vim'

  vim.cmd([[
    let g:rustfmt_autosave = 1
    let g:rustfmt_emit_files = 1
    let g:rustfmt_fail_silently = 0
    set nobackup
    set nowritebackup
    set updatetime=300
    set signcolumn=yes
  ]])

  --TypeScript
  use 'pangloss/vim-javascript'
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use ({'styled-components/vim-styled-components', branch = "main" })
  use 'jparise/vim-graphql'

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	})

	-- Auto Closing
	use("windwp/nvim-autopairs")
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
  use 'pseewald/vim-anyfold'
  
	-- Markdown Viewer
	use({ "ellisonleao/glow.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)

