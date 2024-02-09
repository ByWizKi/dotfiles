return {
  "mfussenegger/nvim-lint", -- Déclaration du plugin nvim-lint pour être utilisé.
  event = {
    "BufReadPre", -- Déclencheur pour lancer le linting avant la lecture du contenu du buffer.
    "BufNewFile", -- Déclencheur pour lancer le linting lors de la création d'un nouveau fichier.
  },
  config = function() -- Début de la fonction de configuration du plugin.
    local lint = require("lint") -- Charge le module lint.

    -- Configuration des linters à utiliser pour chaque type de fichier (filetype).
    lint.linters_by_ft = {
      javascript = { "eslint_d" }, -- Utilise eslint_d pour le linting de fichiers JavaScript.
      typescript = { "eslint_d" }, -- Utilise eslint_d pour le linting de fichiers TypeScript.
      javascriptreact = { "eslint_d" }, -- Utilise eslint_d pour le linting de fichiers JavaScript React.
      typescriptreact = { "eslint_d" }, -- Utilise eslint_d pour le linting de fichiers TypeScript React.
      svelte = { "eslint_d" }, -- Utilise eslint_d pour le linting de fichiers Svelte.
      python = { "pylint" }, -- Utilise pylint pour le linting de fichiers Python.
    }

    -- Crée un groupe d'auto-commandes pour le linting avec un identifiant unique et efface les anciennes commandes si elles existent.
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Crée des auto-commandes pour déclencher le linting lors de certains événements dans l'éditeur.
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup, -- Associe ces auto-commandes au groupe créé précédemment.
      callback = function() -- Fonction de rappel à exécuter lors des événements spécifiés.
        lint.try_lint() -- Tente de lancer le linting pour le buffer actuel.
      end,
    })

    -- Définit un raccourci clavier pour déclencher manuellement le linting du fichier courant.
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" }) -- Description du raccourci pour le linting.
  end,
}
