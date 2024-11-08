return {
    "folke/which-key.nvim",
    opts = {
        defaults = {},
        spec = {
          {
            { "<leader>t", group = "toggle term", icon = { icon = " ", color = "orange" } },
            { "<leader>n", group = "package info", icon = { icon = " ", color = "green" } },
          },
        },
      }
}