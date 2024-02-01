-----------------------------------------------------------
-- Fichier de configuration du tableau de bord
-----------------------------------------------------------

-- Plugin : alpha-nvim
-- URL : https://github.com/goolord/alpha-nvim
-- Le plugin alpha-nvim fournit une interface de tableau de bord personnalisable
-- pour Neovim, qui s'affiche au démarrage de l'éditeur. Il permet d'afficher
-- un menu interactif pour des actions fréquentes telles que créer un nouveau
-- fichier, ouvrir un fichier, mettre à jour les plugins, etc.

-- Pour des exemples de configuration, voir : https://github.com/goolord/alpha-nvim/discussions/16

local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')

-- Pied de page
-- Affiche la version de Neovim et la date et l'heure actuelles.
local function footer()
  local version = vim.version()
  local print_version = "v" .. version.major .. '.' .. version.minor .. '.' .. version.patch
  local datetime = os.date('%Y/%m/%d %H:%M:%S')

  return print_version .. ' - ' .. datetime
end

-- Bannière
-- Affiche une bannière artistique au démarrage de Neovim.
local banner = {
  "                                                    ",
  " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                    ",
}

dashboard.section.header.val = banner

-- Menu
-- Propose un menu de raccourcis pour différentes actions dans Neovim.
dashboard.section.buttons.val = {
  dashboard.button('e', '  Nouveau fichier', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', '  Trouver un fichier', ':NvimTreeOpen<CR>'),
  dashboard.button('s', '  Paramètres', ':e $MYVIMRC<CR>'),
  dashboard.button('u', '  Mettre à jour les plugins', ':Lazy update<CR>'),
  dashboard.button('q', '  Quitter', ':qa<CR>'),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)

