-----------------------------------------------------------
-- Fichier de configuration du gestionnaire de plugins
-----------------------------------------------------------

-- Gestionnaire de plugins : lazy.nvim
-- URL : https://github.com/folke/lazy.nvim

-- Pour des informations sur les plugins installés, voir le README :
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Initialisation de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- dernière version stable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Utiliser un appel protégé pour ne pas générer d'erreur à la première utilisation
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Commencer la configuration
lazy.setup({
  spec = {
    -- Thème de couleur :
    {
      "bluz71/vim-moonfly-colors",
      name = "moonfly",
      lazy = true,
      priority = 1000,
    },

    -- Icônes
    { 'kyazdani42/nvim-web-devicons', lazy = true },

    -- Tableau de bord (écran de démarrage)
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Labels Git
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    -- Explorateur de fichiers
    {
      'kyazdani42/nvim-tree.lua',
      lazy = true,
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- BarBar
      {'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'kyazdani42/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {

        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
      },



    -- Barre de statut
    {
      'nvim-lualine/lualine.nvim',
      lazy = true,
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Treesitter

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = true },

    -- Ligne d'indentation
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

    -- Visualisation des tags
    { 'preservim/tagbar' },

    -- Auto-association
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- LSP
    { 'neovim/nvim-lspconfig', lazy = true },

    -- Autocomplétion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
    -- Codeium
    {
      'Exafunction/codeium.vim',
      event = 'BufEnter',
    },

  },
})

