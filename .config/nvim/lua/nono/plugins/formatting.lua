return {
  "stevearc/conform.nvim", -- Le plugin de formatage
  lazy = true, -- Charge le plugin de manière paresseuse
  event = { "BufReadPre", "BufNewFile" }, -- Charge le plugin avant la lecture d'un fichier ou la création d'un nouveau fichier
  config = function()
    local conform = require("conform") -- Importe le module conform

    -- Configuration des formateurs par type de fichier
    conform.setup({
      formatters_by_ft = {
        -- Liste des formateurs par type de fichier. Utilisez "prettier" pour les fichiers web et d'autres formateurs pour d'autres langages.
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" }, -- Utilise stylua pour le Lua
        python = { "isort", "black" }, -- Utilise isort et black pour Python
        cpp = { "clang-format" }, -- clang-format pour C++
        c = { "clang-format" }, -- clang-format pour C
        rust = { "rustfmt" }, -- rustfmt pour Rust
        go = { "goimports" }, -- goimports pour Go
        dart = { "dartfmt" }, -- dartfmt pour Dart
        sql = { "sql-formatter" }, -- sql-formatter pour SQL
        java = { "google-java-format" }, -- google-java-format pour Java
        kotlin = { "ktlint" }, -- ktlint pour Kotlin
        php = { "phpcbf", "phpcs" }, -- phpcbf et phpcs pour PHP
        csharp = { "csharpier" }, -- csharpier pour C#
        ruby = { "rufo" }, -- rufo pour Ruby
      },
      format_on_save = { -- Configuration du formatage à la sauvegarde
        lsp_fallback = true, -- Utilise le formateur LSP en cas de besoin
        async = false, -- Désactive le formatage asynchrone
        timeout_ms = 1000, -- Timeout après 1000 ms
      },
    })

    -- Raccourci pour formater manuellement le fichier ou une sélection
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true, -- Utilise le formateur LSP en cas de besoin
        async = false, -- Désactive le formatage asynchrone
        timeout_ms = 1000, -- Timeout après 1000 ms
      })
    end, { desc = "Formater le fichier ou la sélection (en mode visuel)" })
  end,
}

