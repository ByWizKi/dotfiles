return {
  "windwp/nvim-autopairs", -- Nom du plugin nvim-autopairs
  event = { "InsertEnter" }, -- Charge le plugin uniquement lors de l'entrée en mode insertion
  dependencies = {
    "hrsh7th/nvim-cmp", -- Déclare une dépendance au plugin nvim-cmp (plugin de complétion)
  },
  priority = 100, -- Définit la priorité de chargement du plugin
  config = function()
    -- Importe le module nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- Configure nvim-autopairs
    autopairs.setup({
      check_ts = true, -- Active la vérification avec Treesitter
      ts_config = {
        lua = { "string" }, -- N'ajoute pas de paires automatiquement dans les nœuds de chaînes de caractères Lua analysés par Treesitter
        javascript = { "template_string" }, -- N'ajoute pas de paires automatiquement dans les chaînes de modèles (template strings) JavaScript analysées par Treesitter
        java = false, -- Désactive la vérification Treesitter pour le langage Java
      },
    })

    -- Importe la fonctionnalité de complétion de nvim-autopairs
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- Importe le plugin nvim-cmp (plugin de complétion)
    local cmp = require("cmp")

    -- Intègre nvim-autopairs avec le système de complétion pour que les deux fonctionnent ensemble
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
