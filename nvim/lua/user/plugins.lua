local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  --colorschmes
  use "shaunsingh/nord.nvim"
  use "rebelot/kanagawa.nvim"
  use "EdenEast/nightfox.nvim"

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use "elixir-editors/vim-elixir"

  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use {
    "ahmedkhalf/project.nvim",
    requires = {"nvim-telescope/telescope.nvim"}
  }

  -- use {
  --   "Shatur/neovim-session-manager",
  --   requires = {
  --     {"nvim-lua/plenary.nvim"},
  --     {"nvim-telescope/telescope.nvim"}
  --   }
  -- }

  use {
    "kyazdani42/nvim-tree.lua",
    requires = {"kyazdani42/nvim-web-devicons"}
  }

  use {
    "akinsho/bufferline.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }

  use {
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }

  use "folke/which-key.nvim"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
      {"hrsh7th/cmp-vsnip"},
      {"hrsh7th/vim-vsnip"}
    }
  }

  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive" -- the premier Vim plugin for Git
  use {
    "tpope/vim-rhubarb", -- fugitive support for github
    requires = "tpope/vim-fugitive"
  }

  use {
    'numToStr/Comment.nvim', --Smart and Powerful commenting
    config = function()
      require('Comment').setup()
    end
  }

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  use "DarwinSenior/nvim-colorizer.lua"

  use "lewis6991/impatient.nvim"

  use "goolord/alpha-nvim"

  use "moll/vim-bbye" --:Bdelete and :Bwipeout commands that behave like well designed citizens

  use {
    "ggandor/lightspeed.nvim", --cutting-edge motion plugin
    requires = "tpope/vim-repeat"
  }

  use "takac/vim-hardtime"  -- I want to stop using h/j/k/l repeatedly

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
