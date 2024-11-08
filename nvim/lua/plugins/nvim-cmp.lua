return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require('cmp')

        opts.window = {
          completion = cmp.config.window.bordered({
              winhighlight = "FloatBorder:CursorLineSign"
          }),
          documentation = cmp.config.window.bordered({
              winhighlight = "FloatBorder:CursorLineSign"
          }),
      }
    end
}