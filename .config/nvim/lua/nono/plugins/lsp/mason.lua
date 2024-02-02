return {
  "williamboman/mason.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- Configuration de Mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Configuration de Mason-LSPconfig
    mason_lspconfig.setup({
      ensure_installed = {
        "pyright",
        "jdtls",
        "html",
        "tsserver",
        "cssls",
        "sumneko_lua",
        -- Ajoute d'autres serveurs LSP selon les besoins
      },
      automatic_installation = true,
    })

    -- Configuration de Mason Tool Installer
    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "isort",
        "prettier",
        "stylua",
        "eslint_d",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "jdtls",
        -- Ajoute d'autres outils selon les besoins
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
