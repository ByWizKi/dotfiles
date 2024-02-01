-----------------------------------------------------------
-- Paramètres généraux et configuration de Neovim
-----------------------------------------------------------

-- Les options par défaut ne sont pas incluses
-- Voir : https://neovim.io/doc/user/vim_diff.html
-- [2] Valeurs par défaut - *nvim-defaults*

local g = vim.g       -- Variables globales
local opt = vim.opt   -- Définir des options (globales/buffer/fenêtres)

-----------------------------------------------------------
-- Général
-----------------------------------------------------------
opt.mouse = 'a'                       -- Activer le support de la souris
opt.clipboard = 'unnamedplus'         -- Copier/coller dans le presse-papiers système
opt.swapfile = false                  -- Ne pas utiliser de fichier d'échange
opt.completeopt = 'menuone,noinsert,noselect'  -- Options d'autocomplétion

-----------------------------------------------------------
-- Interface utilisateur de Neovim
-----------------------------------------------------------
opt.number = true           -- Afficher le numéro de ligne
opt.showmatch = true        -- Surligner la parenthèse correspondante
opt.foldmethod = 'marker'   -- Activer le pliage (par défaut 'foldmarker')
opt.colorcolumn = '80'      -- Marqueur de longueur de ligne à 80 colonnes
opt.splitright = true       -- Diviser verticalement à droite
opt.splitbelow = true       -- Diviser horizontalement en bas
opt.ignorecase = true       -- Ignorer la casse lors de la recherche
opt.smartcase = true        -- Ignorer la casse pour l'ensemble du motif
opt.linebreak = true        -- Retour à la ligne au bord des mots
opt.termguicolors = true    -- Activer les couleurs RVB 24 bits
opt.laststatus=3            -- Définir la barre de statut globale

-----------------------------------------------------------
-- Onglets, indentation
-----------------------------------------------------------
opt.expandtab = true        -- Utiliser des espaces au lieu de tabulations
opt.shiftwidth = 4          -- Décaler de 4 espaces lors de l'insertion d'un tab
opt.tabstop = 4             -- 1 tabulation == 4 espaces
opt.smartindent = true      -- Auto-indentation des nouvelles lignes

-----------------------------------------------------------
-- Mémoire, CPU
-----------------------------------------------------------
opt.hidden = true           -- Activer les tampons en arrière-plan
opt.history = 100           -- Conserver N lignes dans l'historique
opt.lazyredraw = true       -- Défilement plus rapide
opt.synmaxcol = 240         -- Colonne max pour la coloration syntaxique
opt.updatetime = 250        -- ms à attendre pour déclencher un événement

-----------------------------------------------------------
-- Démarrage
-----------------------------------------------------------
-- Désactiver l'introduction de nvim
opt.shortmess:append "sI"

-- -- Désactiver les plugins intégrés
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end

