return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "███╗   ██╗ ██████╗ ███╗   ██╗ ██████╗ ",
      "████╗  ██║██╔═══██╗████╗  ██║██╔═══██╗",
      "██╔██╗ ██║██║   ██║██╔██╗ ██║██║   ██║",
      "██║╚██╗██║██║   ██║██║╚██╗██║██║   ██║",
      "██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝",
      "╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ",
      "                                      ",
    }

    -- Set menu
    dashboard.section.buttons.val = {

      dashboard.button("qa", "  > New File", "<cmd>ene<CR>"),
      dashboard.button(
        "qfd",
        "  > Toggle file explorer",
        "<cmd>NvimTreeToggle<CR>"
      ),
      dashboard.button(
        "qfi",
        "󰱼 > Find File",
        "<cmd>Telescope find_files<CR>"
      ),
      dashboard.button(
        "qfw",
        "  > Find Word",
        "<cmd>Telescope live_grep<CR>"
      ),
      dashboard.button(
        "qrf",
        "󰁯  > Restore Session For Current Directory",
        "<cmd>SessionRestore<CR>"
      ),
      dashboard.button("q,", " > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
  end,
}
