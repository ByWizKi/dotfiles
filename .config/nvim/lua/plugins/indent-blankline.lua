-----------------------------------------------------------
-- Fichier de configuration des lignes d'indentation
-----------------------------------------------------------

-- Plugin : indent-blankline
-- URL : https://github.com/lukas-reineke/indent-blankline.nvim
-- Le plugin indent-blankline fournit des lignes d'indentation visuelles
-- dans Neovim, permettant de voir plus clairement la structure et la
-- profondeur de l'indentation du code.

local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  return
end

ibl.setup {
  indent = { char = "▎" },  -- Caractère utilisé pour les lignes d'indentation
  exclude = {
    filetypes = {
      -- Liste des types de fichiers où les lignes d'indentation ne seront pas affichées
      'lspinfo',
      'packer',
      'checkhealth',
      'help',
      'man',
      'dashboard',
      'git',
      'markdown',
      'text',
      'terminal',
      'NvimTree',
    },

    buftypes = {
      -- Liste des types de tampons où les lignes d'indentation ne seront pas affichées
      'terminal',
      'nofile',
      'quickfix',
      'prompt',
    },
  },
}

