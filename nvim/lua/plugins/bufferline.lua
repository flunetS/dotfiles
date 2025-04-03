return {
  "akinsho/bufferline.nvim",
  event = "UIEnter",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({
      options = {
        tab_size = 15,
        separator_style = { "", "" }, -- separator_style = {'', ''},
        indicator = {
          style = "underline",
        },
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        debug = { logging = true },
        style_preset = { bufferline.style_preset.minimal },
        mode = "buffers",
        sort_by = "insert_after_current",
        move_wraps_at_ends = true,
        right_mouse_command = "vert sbuffer %d",
        show_close_icon = false,
        show_buffer_close_icons = true,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            text = "EXPLORER",
            filetype = "neo-tree",
            highlight = "PanelHeading",
            text_align = "left",
            separator = true,
          },
          {
            text = " FLUTTER OUTLINE",
            filetype = "flutterToolsOutline",
            highlight = "PanelHeading",
            separator = true,
          },
          {
            text = "UNDOTREE",
            filetype = "undotree",
            highlight = "PanelHeading",
            separator = true,
          },
          {
            text = "󰆼 DATABASE VIEWER",
            filetype = "dbui",
            highlight = "PanelHeading",
            separator = true,
          },
          {
            text = " DIFF VIEW",
            filetype = "DiffviewFiles",
            highlight = "PanelHeading",
            separator = true,
          },
        },
      },
    })
  end,
}
