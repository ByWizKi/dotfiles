-- Configuration des options de Neovim en Lua

-- Options générales
vim.opt.number = true -- Afficher les numéros de ligne
vim.opt.relativenumber = true -- Afficher les numéros de ligne relatifs
vim.opt.hlsearch = false -- Ne pas surligner les recherches après leur exécution
vim.opt.ignorecase = true -- Recherche insensible à la casse
vim.opt.smartcase = true -- Recherche sensible à la casse si la recherche contient des majuscules
vim.opt.incsearch = true -- Recherche incrémentale
vim.opt.tabstop = 4 -- Nombre d'espaces qu'un caractère de tabulation représente
vim.opt.shiftwidth = 4 -- Nombre d'espaces pour chaque niveau d'indentation
vim.opt.expandtab = true -- Convertir les tabulations en espaces
vim.opt.smartindent = true -- Indentation automatique intelligente
vim.opt.wrap = false -- Ne pas retourner à la ligne automatiquement
vim.opt.termguicolors = true -- Activer le support des couleurs 24 bits
vim.opt.splitbelow = true -- Forcer les nouveaux splits à s'ouvrir en bas
vim.opt.splitright = true -- Forcer les nouveaux splits verticaux à s'ouvrir à droite
vim.opt.cursorline = true -- Surligner la ligne actuelle
vim.opt.clipboard = "unnamedplus" -- Utiliser le presse-papiers système
vim.opt.mouse = "a" -- Activer la souris dans tous les modes

-- Autres options utiles
vim.opt.backup = false -- Ne pas créer de fichier de backup
vim.opt.writebackup = false -- Ne pas créer de fichier de backup lors de l'écriture
vim.opt.updatetime = 3 -- Temps en millisecondes avant d'enregistrer le swap et de mettre à jour l'autocomplétion
vim.opt.signcolumn = "yes" -- Toujours afficher la colonne de signe (utile pour Git, diagnostics LSP, etc.)
vim.opt.scrolloff = 8 -- Nombre minimal de lignes à maintenir au-dessus et en dessous du curseur
vim.opt.sidescrolloff = 8 -- Nombre minimal de colonnes à maintenir à gauche et à droite du curseur

-- Désactiver les sons et les flashs d'erreur
vim.opt.errorbells = false
vim.opt.visualbell = false
