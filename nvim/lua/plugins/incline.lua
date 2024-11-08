return {
    'b0o/incline.nvim',
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'

      local bg_color = '#3b4261'

      require('incline').setup {
        highlight = {
          groups = {
            InclineNormal = { guifg = '#c8d3f5' },
            InclineNormalNC = { guifg = '#7f89b8' },
          }
        },
        window = {
            padding = 0,
            margin = { horizontal = 0 },
        },

        debounce_threshold = {
          falling = 75,
          rising = 75,
        },

        render = function(props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')

            if filename == '' then
                filename = '[No Name]'
            end

            local ft_icon, ft_color = devicons.get_icon_color(filename)

            return {
                { '', guifg = ft_color or bg_color },
                {
                  ft_icon and { ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
                  { '', guifg = bg_color, guibg = ft_color},
                  ' ',
                  { filename, gui = 'bold' },
                  ' ',
                  guibg = bg_color,
                }
              }
        end,
      }
    end,
}