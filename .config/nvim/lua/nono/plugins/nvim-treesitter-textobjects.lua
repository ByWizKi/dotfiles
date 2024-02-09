return {
  "nvim-treesitter/nvim-treesitter-textobjects", -- Déclaration du plugin nvim-treesitter-textobjects pour être utilisé.
  lazy = true, -- Le plugin est chargé de manière paresseuse, c'est-à-dire uniquement quand c'est nécessaire.
  config = function() -- Début de la fonction de configuration du plugin.
    require("nvim-treesitter.configs").setup({ -- Appelle la configuration de nvim-treesitter pour configurer les extensions.
      textobjects = { -- Configuration des objets de texte pour la manipulation des éléments syntaxiques.
        select = { -- Configuration de la sélection d'objets de texte.
          enable = true, -- Active la fonctionnalité de sélection d'objets de texte.

          lookahead = true, -- Active la recherche anticipée pour se déplacer automatiquement vers l'objet de texte suivant, similaire à targets.vim.

          keymaps = { -- Définition des raccourcis clavier pour la sélection d'objets de texte.
            ["a="] = { -- Sélectionne la partie extérieure d'une affectation.
              query = "@assignment.outer",
              desc = "Select outer part of an assignment",
            },
            ["i="] = { -- Sélectionne la partie intérieure d'une affectation.
              query = "@assignment.inner",
              desc = "Select inner part of an assignment",
            },
            ["l="] = { -- Sélectionne la partie gauche d'une affectation.
              query = "@assignment.lhs",
              desc = "Select left hand side of an assignment",
            },
            ["r="] = { -- Sélectionne la partie droite d'une affectation.
              query = "@assignment.rhs",
              desc = "Select right hand side of an assignment",
            },
            ["aa"] = { -- Sélectionne la partie extérieure d'un paramètre ou argument.
              query = "@parameter.outer",
              desc = "Select outer part of a parameter/argument",
            },
            -- Plusieurs autres configurations pour la sélection d'objets de texte spécifiques comme des paramètres, des conditionnels, des boucles, des appels de fonction, des définitions de fonction/méthode, et des classes.
          },
        },
        swap = { -- Configuration pour l'échange d'objets de texte.
          enable = true, -- Active la fonctionnalité d'échange d'objets de texte.
          swap_next = { -- Configuration pour échanger avec l'élément syntaxique suivant.
            ["<leader>na"] = "@parameter.inner", -- Échange le paramètre ou argument actuel avec le suivant.
            ["<leader>nm"] = "@function.outer", -- Échange la fonction ou méthode actuelle avec la suivante.
          },
          swap_previous = { -- Configuration pour échanger avec l'élément syntaxique précédent.
            ["<leader>pa"] = "@parameter.inner", -- Échange le paramètre ou argument actuel avec le précédent.
            ["<leader>pm"] = "@function.outer", -- Échange la fonction ou méthode actuelle avec la précédente.
          },
        },
        move = { -- Configuration pour le déplacement entre objets de texte.
          enable = true, -- Active la fonctionnalité de déplacement entre objets de texte.
          set_jumps = true, -- Configure si les déplacements doivent être enregistrés dans la jumplist pour naviguer entre eux avec Ctrl-o et Ctrl-i.
          goto_next_start = { -- Configuration pour aller au début de l'objet de texte suivant.
            ["]f"] = { -- Va au début du prochain appel de fonction.
              query = "@call.outer",
              desc = "Next function call start",
            },
            -- Plusieurs autres configurations pour naviguer vers le début d'autres éléments syntaxiques comme des méthodes/fonctions, des classes, des conditionnels, des boucles, et des portées ou pliages spécifiques.
          },
          goto_next_end = { -- Configuration pour aller à la fin de l'objet de texte suivant.
            -- Des configurations similaires à `goto_next_start` mais pour naviguer vers la fin des éléments syntaxiques.
          },
          goto_previous_start = { -- Configuration pour aller au début de l'objet de texte précédent.
            -- Des configurations similaires à `goto_next_start` mais pour naviguer vers le début des éléments syntaxiques précédents.
          },
          goto_previous_end = { -- Configuration pour aller à la fin de l'objet de texte précédent.
            -- Des configurations similaires à `goto_next_end` mais pour naviguer vers la fin des éléments syntaxiques précédents.
          },
        },
      },
    })
  end,
}
