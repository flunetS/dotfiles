return {
  "nvim-focus/focus.nvim",
  event = "VeryLazy",
  config = function()
    require("focus").setup({
      ui = {
        cursorline = true, -- Display a cursorline in the focussed window only
      },
    })
  end,
}

