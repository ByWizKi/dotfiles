-- Configuration de lualine
require('lualine').setup {
  options = {
    icons_enabled = true, -- Activer les icônes dans la barre de statut
    theme = 'moonfly', -- Définir le thème à 'moonfly'
    component_separators = { left = '', right = ''}, -- Séparateurs de composants personnalisés
    section_separators = { left = '', right = ''}, -- Séparateurs de sections personnalisés
    disabled_filetypes = {
      statusline = {}, -- Liste des types de fichiers où la barre de statut est désactivée
      winbar = {}, -- Liste des types de fichiers où la barre de titre de fenêtre est désactivée
    },
    ignore_focus = {}, -- Ignorer le focus pour ces buffers/fenêtres
    always_divide_middle = true, -- Toujours diviser la barre de statut au milieu
    globalstatus = false, -- Utiliser une barre de statut globale (nécessite Neovim >= 0.7)
    refresh = {
      statusline = 1000, -- Fréquence de rafraîchissement de la barre de statut en ms
      tabline = 1000, -- Fréquence de rafraîchissement de la ligne d'onglets en ms
      winbar = 1000, -- Fréquence de rafraîchissement de la barre de titre de fenêtre en ms
    }
  },
  sections = {
    lualine_a = {'mode'}, -- Sections 'a' : affiche le mode Vim
    lualine_b = {'branch', 'diff', 'diagnostics'}, -- Sections 'b' : affiche la branche Git, les différences, et les diagnostics
    lualine_c = {'filename'}, -- Sections 'c' : affiche le nom du fichier
    lualine_x = {'encoding', 'fileformat', 'filetype'}, -- Sections 'x' : affiche l'encodage, le format de fichier, et le type de fichier
    lualine_y = {'progress'}, -- Sections 'y' : affiche la progression dans le fichier
    lualine_z = {'location'} -- Sections 'z' : affiche la position du curseur
  },
  inactive_sections = {
    -- Configuration des sections pour les fenêtres inactives
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {}, -- Configuration de la ligne d'onglets (non utilisée ici)
  winbar = {}, -- Configuration de la barre de titre de fenêtre
  inactive_winbar = {}, -- Configuration de la barre de titre de fenêtre pour les fenêtres inactives
  extensions = {} -- Extensions de lualine (non utilisées ici)
}

