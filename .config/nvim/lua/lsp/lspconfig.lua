-----------------------------------------------------------
-- Fichier de configuration LSP de Neovim
-----------------------------------------------------------

-- Plugin : nvim-lspconfig
-- URL : https://github.com/neovim/nvim-lspconfig

-- Pour la configuration, voir le Wiki : https://github.com/neovim/nvim-lspconfig/wiki
-- Les paramètres d'autocomplétion de "nvim-cmp" sont définis dans plugins/nvim-cmp.lua

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

-- Ajouter des capacités supplémentaires prises en charge par nvim-cmp
-- Voir : https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Utiliser une fonction on_attach pour mapper les touches suivantes
-- après que le serveur de langage se soit attaché au tampon courant
local on_attach = function(client, bufnr)
  -- Activer la complétion déclenchée par <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Surlignage des références.
  -- Voir : https://sbulav.github.io/til/til-neovim-highlight-references/
  -- pour le délai de déclenchement du surlignage voir : `vim.opt.updatetime`
  if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
      vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
      vim.api.nvim_create_autocmd("CursorHold", {
          callback = vim.lsp.buf.document_highlight,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Surlignage du document",
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
          callback = vim.lsp.buf.clear_references,
          buffer = bufnr,
          group = "lsp_document_highlight",
          desc = "Effacer toutes les références",
      })
  end

  -- Mappages.
  -- Voir `:help vim.lsp.*` pour la documentation sur l'une des fonctions ci-dessous
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Paramètres de diagnostic :
-- voir : `:help vim.diagnostic.config`
-- Personnalisation de l'affichage des diagnostics
vim.diagnostic.config({
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
	},
})

-- Afficher automatiquement les diagnostics de ligne dans une fenêtre flottante
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Mappages.
-- Voir `:help vim.diagnostic.*` pour la documentation sur l'une des fonctions ci-dessous
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

--[[
Configuration des serveurs de langage :

Pour la liste des serveurs de langage, voir :
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Serveurs de langage installés :

Bash          -> bashls
Python        -> pyright
C-C++         -> clangd
HTML/CSS/JSON -> vscode-html-languageserver
JavaScript/TypeScript -> tsserver
--]]

-- Définir `root_dir` si nécessaire
-- Voir : https://github.com/neovim/nvim-lspconfig/issues/320
-- C'est une solution temporaire, peut-être pas fonctionnelle avec certains serveurs.
local root_dir = function()
  return vim.fn.getcwd()
end

-- Utiliser une boucle pour appeler 'setup' sur plusieurs serveurs et
-- mapper les mappages locaux de tampon lorsque le serveur de langage se joint.
-- Ajoutez votre serveur de langage ci-dessous :
local servers = { 'bashls', 'pyright', 'clangd', 'html', 'cssls', 'tsserver' }

-- Appeler setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    flags = {
      -- par défaut dans neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

