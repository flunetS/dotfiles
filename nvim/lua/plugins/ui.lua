return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        formats = {
          key = function(item)
            return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
          end,
        },
        preset = {
          header = [[
███████╗██╗     ██╗   ██╗███╗   ██╗███████╗████████╗███████╗
██╔════╝██║     ██║   ██║████╗  ██║██╔════╝╚══██╔══╝██╔════╝
█████╗  ██║     ██║   ██║██╔██╗ ██║█████╗     ██║   ███████╗
██╔══╝  ██║     ██║   ██║██║╚██╗██║██╔══╝     ██║   ╚════██║
██║     ███████╗╚██████╔╝██║ ╚████║███████╗   ██║   ███████║
╚═╝     ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚══════╝
]],

          keys = {
            {
              action = ":lua Snacks.dashboard.pick('files')",
              desc = "Find File",
              icon = "💡 ",
              key = "f",
            },
            {
              action = ":lua Snacks.dashboard.pick('oldfiles')",
              desc = "Recent Files",
              icon = "📕 ",
              key = "r",
            },
            {
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
              desc = "Config",
              icon = "✏️  ",
              key = "c",
            },
            {
              action = "session",
              desc = "Restore Session",
              icon = "🔨 ",
              key = "s",
            },
            {
              action = ":LazyExtras",
              desc = "Lazy Extras",
              icon = "🔋 ",
              key = "x",
            },
            {
              action = ":Lazy",
              desc = "Lazy",
              icon = "💊 ",
              key = "l",
            },
            {
              action = ":qa",
              desc = "Quit",
              icon = "🔌 ",
            },
          },
        },

        sections = {
          {
            section = "header",
            pane = 1,
          },
          { section = "keys", pane = 1, gap = 1, padding = 1 },
          { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
