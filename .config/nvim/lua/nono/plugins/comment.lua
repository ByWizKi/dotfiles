return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    -- enable comment
    comment.setup({

      -- Importation du plugin Comment.nvim
      require("Comment").setup({

        -- Activer le mappage des touches automatiquement
        mappings = {
          -- Les touches basiques pour commenter/décommenter du code
          basic = true,
          -- Les touches pour commenter/décommenter des blocs de code
          extra = true,
          -- Les touches pour commenter/décommenter en ligne (ne change pas de ligne après avoir commenté)
          extended = false,
        },

        -- Configuration des préfixes de commentaire pour chaque type de fichier
        -- Par défaut, cela utilise les préfixes définis par le langage lui-même
        pre_hook = nil,

        -- Permet de définir une fonction qui sera appelée après le processus de commentaire
        -- Utile pour intégrer des fonctionnalités supplémentaires
        post_hook = nil,
      }),
    })
  end,
}
