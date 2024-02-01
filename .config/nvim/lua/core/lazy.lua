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
    -- Le thème de couleur doit être disponible au démarrage de Neovim.
    {
      'navarasu/onedark.nvim',
      lazy = false, -- assurez-vous de charger ceci au démarrage s'il s'agit de votre thème principal
      priority = 1000, -- assurez-vous de charger ceci avant tous les autres plugins de démarrage
    },

    -- autres thèmes de couleur :
    { 'tanvirtin/monokai.nvim', lazy = true },
    { 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },

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
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Barre de statut
    {
      'freddiehaddad/feline.nvim',
      dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

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
    { 'neovim/nvim-lspconfig' },

    -- Autocomplétion
    {
      'hrsh7th/nvim-cmp',
      -- charger cmp à l'entrée en mode insertion
      event = 'InsertEnter',
      -- ces dépendances ne seront chargées que lorsque cmp sera chargé
      -- les dépendances sont toujours chargées de manière paresseuse sauf indication contraire
      dependencies = {
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
      },
    },
  },
})

