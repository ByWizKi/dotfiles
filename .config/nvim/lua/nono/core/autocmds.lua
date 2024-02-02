-- Charger une configuration spécifique à un type de fichier
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})

-- Sauvegarder automatiquement lors du changement de buffer ou de la perte de focus
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = "*",
  command = "silent! wa",
})

-- Fermer automatiquement le QuickFix lorsqu'il est la dernière fenêtre
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.winnr("$") == 1 and vim.bo.buftype == "quickfix" then
      vim.cmd("q")
    end
  end,
})

-- Appliquer des paramètres spécifiques lors de l'ouverture de fichiers d'un certain type
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.md",
  callback = function()
    vim.wo.spell = true
    vim.bo.spelllang = "en_us"
  end,
})

-- Nettoyer les espaces blancs inutiles à la sauvegarde d'un fichier
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})
