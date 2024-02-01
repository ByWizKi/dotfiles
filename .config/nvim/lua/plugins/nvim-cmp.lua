-----------------------------------------------------------
-- Fichier de configuration de l'autocomplétion
-----------------------------------------------------------

-- Plugin : nvim-cmp
-- URL : https://github.com/hrsh7th/nvim-cmp
-- Le plugin nvim-cmp est un moteur d'autocomplétion pour Neovim qui fournit
-- une interface utilisateur moderne et des fonctionnalités étendues pour
-- l'autocomplétion, y compris l'intégration avec les serveurs LSP et les
-- snippets.

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then
  return
end

cmp.setup {
  -- Chargement du support des snippets
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  -- Paramètres de complétion
  completion = {
    --completeopt = 'menu,menuone,noselect'
    keyword_length = 2  -- Longueur minimale du mot-clé pour déclencher l'autocomplétion
  },

  -- Mappage de touches
  mapping = {
    --['<C-n>'] = cmp.mapping.select_next_item(),
    --['<C-p>'] = cmp.mapping.select_prev_item(),
    --['<C-d>'] = cmp.mapping.scroll_docs(-4),
    --['<C-f>'] = cmp.mapping.scroll_docs(4),
    --['<C-Space>'] = cmp.mapping.complete(),
    --['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- Mappage de la touche Tab
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end
  },
  -- Chargement des sources, voir : https://github.com/topics/nvim-cmp
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

