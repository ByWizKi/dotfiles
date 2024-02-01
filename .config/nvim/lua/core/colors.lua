-----------------------------------------------------------
-- Fichier de configuration des thèmes de couleur
-----------------------------------------------------------

-- Voir : https://github.com/brainfucksec/neovim-lua#appearance

-- Thème de couleur de l'interface utilisateur de Neovim.
-- Ajoutez le thème de couleur sélectionné dans les valeurs `require` ci-dessous.
-- Thèmes de couleur disponibles actuellement : onedark, monokai, rose-pine.
local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

-- Note : L'instruction pour charger le thème de couleur peut varier.
-- Voir le README du thème de couleur sélectionné pour l'instruction
-- à utiliser.
-- par exemple : require('color_scheme').setup{}, vim.cmd('color_scheme') ...
require('onedark').setup {
  -- styles : dark, darker, cool, deep, warm, warmer, light
  style = 'darker',
  colors = { fg = '#b2bbcc' }, -- par défaut : #a0a8b7
}
require('onedark').load()

--[[
Thèmes de couleur pour la barre de statut.
Importez les thèmes de couleur suivants dans votre fichier statusline.lua
avec : `require('core/colors').colorscheme_name` où le nom du thème de couleur
est la valeur des variables ci-dessous.

par exemple : `local colors = require('core/colors').onedark_dark
Voir : `core/statusline.lua`

Les thèmes de couleur ci-dessous sont créés en suivant les fichiers "palette" des
thèmes de couleur. Les noms des couleurs sont adaptés pour maintenir un schéma,
les noms originaux peuvent être différents.
--]]
local M = {}

-- Thème : OneDark (dark)
-- Couleurs : https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
M.onedark_dark = {
  bg = '#282c34',
  fg = '#b2bbcc',
  pink = '#c678dd',
  green = '#98c379',
  cyan = '#56b6c2',
  yellow = '#e5c07b',
  orange = '#d19a66',
  red = '#e86671',
}

-- Thème : Monokai (classique)
-- Couleurs : https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', -- par défaut : #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  red = '#e95678',
}

-- Thème : Rosé Pine (principal)
-- Couleurs : https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
-- les noms des couleurs sont adaptés aux formats ci-dessus
M.rose_pine = {
  bg = '#111019', -- par défaut : #191724
  fg = '#e0def4',
  pink = '#eb6f92',
  green = '#9ccfd8',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  red = '#ebbcba',
}

return M

