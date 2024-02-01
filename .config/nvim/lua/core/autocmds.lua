-----------------------------------------------------------
-- Fonctions d'Autocommandes
-----------------------------------------------------------

-- Définir des autocommandes avec les APIs Lua
-- Voir : h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Créer/récupérer un groupe d'autocommandes
local autocmd = vim.api.nvim_create_autocmd   -- Créer une autocommande

-- Paramètres généraux :
------------------------

-- Surligner lors du yank (copie)
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Supprimer les espaces en fin de ligne à l'enregistrement
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Ne pas commenter automatiquement les nouvelles lignes
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Paramètres pour les types de fichiers :
-------------------------------------------

-- Désactiver le marqueur de longueur de ligne
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Définir l'indentation à 2 espaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Paramètres du terminal :
----------------------------

-- Ouvrir un Terminal dans l'onglet de droite
autocmd('CmdlineEnter', {
  command = 'command! Term :botright vsplit term://$SHELL'
})

-- Passer en mode insertion lors du passage au terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '',
  command = 'startinsert'
})

-- Fermer le tampon du terminal à la sortie du processus
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
})

