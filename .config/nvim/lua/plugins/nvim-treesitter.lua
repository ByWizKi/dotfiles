-----------------------------------------------------------
-- Fichier de configuration Treesitter
----------------------------------------------------------

-- Plugin : nvim-treesitter
-- URL : https://github.com/nvim-treesitter/nvim-treesitter
-- nvim-treesitter est un plugin qui utilise la bibliothèque Treesitter pour
-- une coloration syntaxique améliorée et plus précise, ainsi que pour d'autres
-- fonctionnalités liées à la compréhension de la structure du code.

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- Configuration du plugin nvim-treesitter.
-- Voir : https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  -- Liste des noms de parseurs à installer, ou "all" pour tous les installer
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua', 'python',
    'rust', 'typescript', 'vim', 'yaml',
  },
  -- Installer les parseurs de manière synchrone (s'applique uniquement à `ensure_installed`)
  sync_install = false,
  -- Configuration de la coloration syntaxique
  highlight = {
    -- `false` désactive l'extension complètement
    enable = true,
  },
}

