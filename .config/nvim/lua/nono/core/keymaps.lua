-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = "q"

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- On desactive les fleches du clavier
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- On desactive du mode insertion
map("i", "<leader>i", "<Esc>")

-- On cache la recherche
map("n", "<leader>c", ":nohl<CR>")

-- Change split orientation
map("n", "<leader>p", ":split<CR>", { noremap = true, silent = true })
map("n", "<leader>o", ":vsplit<CR>", { noremap = true, silent = true })
map("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })
map("n", "<leader>x", ":only<CR>", { noremap = true, silent = true })

-- Les onglets neovim
-- Ouvrir un nouvel onglet
map("n", "<leader>to", ":tabnew<CR>")
-- Commentaire : Crée un nouvel onglet vide.

-- Fermer l'onglet courant
map("n", "<leader>tp", ":tabclose<CR>")
-- Commentaire : Ferme l'onglet actuellement sélectionné.

-- Naviguer vers l'onglet suivant
map("n", "<leader>]", ":tabnext<CR>")
-- Commentaire : Passe à l'onglet suivant.

-- Naviguer vers l'onglet précédent
map("n", "<leader>[", ":tabprevious<CR>")
-- Commentaire : Passe à l'onglet précédent.

-- La division des fenetres

-- Ouvrir un split horizontal
map("n", "<leader>th", ":split<CR>")
-- Commentaire : Divise la fenêtre actuellement sélectionnée horizontalement.

-- Ouvrir un split vertical
map("n", "<leader>tk", ":vsplit<CR>")
-- Commentaire : Divise la fenêtre actuellement sélectionnée verticalement.

-- Naviguer vers le split de gauche
map("n", "<leader>h", "<C-w>h")
-- Commentaire : Déplace le focus vers la fenêtre divisée située à gauche.

-- Naviguer vers le split de bas
map("n", "<leader>j", "<C-w>j")
-- Commentaire : Déplace le focus vers la fenêtre divisée située en dessous.

-- Naviguer vers le split de haut
map("n", "<leader>k", "<C-w>k")
-- Commentaire : Déplace le focus vers la fenêtre divisée située au-dessus.

-- Naviguer vers le split de droite
map("n", "<leader>l", "<C-w>l")
-- Commentaire : Déplace le focus vers la fenêtre divisée située à droite.

-- Fermer le split courant
map("n", "<leader>qq", "<C-w>c")
-- Commentaire : Ferme la fenêtre divisée actuellement sélectionnée.

-- Ajuster la taille du split - Augmenter la largeur
map("n", "<leader>=", ":vertical resize +5<CR>")
-- Commentaire : Augmente la largeur de la fenêtre divisée verticalement sélectionnée de 5 unités.

-- Ajuster la taille du split - Diminuer la largeur
map("n", "<leader>-", ":vertical resize -5<CR>")
-- Commentaire : Diminue la largeur de la fenêtre divisée verticalement sélectionnée de 5 unités.

-- Ajuster la taille du split - Augmenter la hauteur
map("n", "<leader>q=", ":resize +5<CR>")
-- Commentaire : Augmente la hauteur de la fenêtre divisée horizontalement sélectionnée de 5 unités.

-- Ajuster la taille du split - Diminuer la hauteur
map("n", "<leader>q-", ":resize -5<CR>")
-- Commentaire : Diminue la hauteur de la fenêtre divisée horizontalement sélectionnée de 5 unités.

-- Sauvegarder le fichier courant
map("n", "<leader>.", ":w<CR>", { noremap = true, silent = true })
-- Commentaire : Écrit les modifications du buffer courant sur le disque.

-- Sauvegarder tous les fichiers ouverts
map("n", "<leader>..", ":wa<CR>", { noremap = true, silent = true })
-- Commentaire : Écrit les modifications de tous les buffers ouverts sur le disque.

-- Quitter Neovim
map("n", "<leader>,", ":q<CR>", { noremap = true, silent = true })
-- Commentaire : Quitte l'éditeur. Si des modifications n'ont pas été sauvegardées, Neovim demandera une confirmation.

-- Quitter Neovim sans sauvegarder
map("n", "<leader>Q", ":q!<CR>", { noremap = true, silent = true })
-- Commentaire : Quitte l'éditeur sans sauvegarder les modifications.

-- Renommer le fichier courant
-- Cette action nécessite une fonction plus complexe. Voici un exemple de fonction pour renommer un fichier et le mapping correspondant.
vim.api.nvim_exec(
  [[
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('Nouveau nom: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
]],
  false
)
map(
  "n",
  "<leader>rr",
  ":call RenameFile()<CR>",
  { noremap = true, silent = true }
)
-- Commentaire : Demande un nouveau nom pour le fichier courant, le sauvegarde sous ce nouveau nom, puis supprime l'ancien fichier.

-- Supprimer le fichier courant
-- Comme pour renommer, supprimer un fichier nécessite une approche prudente dans un script.
vim.api.nvim_exec(
  [[
function! DeleteFile()
  let file_name = expand('%')
  if file_name != '' && confirm("Supprimer le fichier: " . file_name . " ?", "&Oui\n&Non", 1) == 1
    exec ':silent !rm ' . file_name
    exec ':bdelete'
    redraw!
  endif
endfunction
]],
  false
)
map(
  "n",
  "<leader>dd",
  ":call DeleteFile()<CR>",
  { noremap = true, silent = true }
)
-- Commentaire : Demande confirmation pour supprimer le fichier courant, puis le supprime et ferme le buffer.

-- Terminal mappings
-- Ouvrir un terminal dans un split horizontal
map("n", "<leader>yh", ":split | terminal<CR>", {})
-- Commentaire : Divise la fenêtre actuellement sélectionnée horizontalement et ouvre un terminal dans le nouveau split.

-- Ouvrir un terminal dans un split vertical
map("n", "<leader>yk", ":vsplit | terminal<CR>", {})
-- Commentaire : Divise la fenêtre actuellement sélectionnée verticalement et ouvre un terminal dans le nouveau split.

-- Ouvrir un terminal dans un nouvel onglet
map("n", "<leader>4", ":tabnew | terminal<CR>", {})
-- Commentaire : Ouvre un terminal dans un nouvel onglet.

-- Sortir du mode d'insertion dans le terminal
map("t", "<leader>i", "<C-\\><C-n>", {})

-- Sortir du mode d'insertion dans le terminal et retourner en mode normal
map("t", "<leader>q", "<C-\\><C-n>:exit<CR>", {})
-- Commentaire : Permet de sortir du mode d'insertion dans le terminal et retourne en mode normal, vous permettant d'utiliser des commandes Neovim.

-- Recharger la configuration de Neovim
map("n", "<leader>r", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
-- Commentaire : Recharge le fichier de configuration principal de Neovim. Utilisez cette commande après avoir modifié

-- Ouvrir la page d'accueil Alpha
map("n", "<leader>e", ":Alpha<CR>")
-- Commentaire : Ouvre la page d'accueil Alpha, vous permettant d'accéder rapidement à vos fichiers récents, de créer de nouveaux fichiers, et plus.

-- NvimTree
map("n", "<leader>f", ":NvimTreeToggle<CR>") -- open/close
map("n", "<leader>fr", ":NvimTreeRefresh<CR>") -- refresh
map("n", "<leader>fd", ":NvimTreeFindFile<CR>") -- search file

-- Telescope
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>fqf", "<ESC>")

-- Codeium
vim.keymap.set('i', '<Tab><Tab>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map("n", "<leader>xx", ":Codeium Disable<CR>")
map("n", "<leader>xa", ":Codeium Enable<CR>")
