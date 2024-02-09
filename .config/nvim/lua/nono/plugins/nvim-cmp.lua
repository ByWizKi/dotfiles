return {
  "hrsh7th/nvim-cmp", -- Nom du plugin nvim-cmp pour la complétion
  event = "InsertEnter", -- Charge le plugin uniquement lors de l'entrée en mode insertion
  dependencies = {
    "hrsh7th/cmp-buffer", -- source de complétion pour le texte présent dans le buffer
    "hrsh7th/cmp-path", -- source de complétion pour les chemins du système de fichiers
    "L3MON4D3/LuaSnip", -- moteur de snippets (morceaux de code réutilisables)
    "saadparwaiz1/cmp_luasnip", -- intégration de LuaSnip avec nvim-cmp pour la complétion automatique
    "rafamadriz/friendly-snippets", -- collection de snippets utiles
    "onsails/lspkind.nvim", -- pictogrammes à la manière de VS Code pour les éléments de complétion
  },
  priority = 1000, -- Définit la priorité de chargement du plugin

  config = function()
    local cmp = require("cmp") -- Importe le module nvim-cmp

    local luasnip = require("luasnip") -- Importe le moteur de snippets LuaSnip

    local lspkind = require("lspkind") -- Importe lspkind pour les pictogrammes

    -- Charge les snippets au style VS Code des plugins installés (par exemple, friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect", -- Options pour le menu de complétion
      },
      snippet = { -- Configure l'interaction entre nvim-cmp et le moteur de snippets
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Utilise LuaSnip pour étendre les snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Sélectionne la suggestion précédente
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Sélectionne la suggestion suivante
        ["<C-h>"] = cmp.mapping.scroll_docs(-4), -- Fait défiler la documentation vers le haut
        ["<C-l>"] = cmp.mapping.scroll_docs(4), -- Fait défiler la documentation vers le bas
        ["<C-Space>"] = cmp.mapping.complete(), -- Affiche les suggestions de complétion
        ["<C-e>"] = cmp.mapping.abort(), -- Ferme le menu de complétion
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirme la sélection sans choisir automatiquement
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- Utilise LSP comme source de complétion
        { name = "luasnip" }, -- Utilise LuaSnip comme source pour les snippets
        { name = "buffer" }, -- Utilise le texte dans le buffer courant comme source
        { name = "path" }, -- Utilise les chemins de fichiers comme source
      }),
      formatting = { -- Configure lspkind pour des pictogrammes style VS Code dans le menu de complétion
        format = lspkind.cmp_format({
          maxwidth = 50, -- Largeur maximale pour les éléments de complétion
          ellipsis_char = "...", -- Caractère pour indiquer la troncature
        }),
      },
    })
  end,
}
