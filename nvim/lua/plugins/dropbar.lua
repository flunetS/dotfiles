return {
  "Bekaboo/dropbar.nvim",
  event = "VeryLazy",
  opts = {
    menu = {
      win_configs = {
        border = "shadow",
        col = function(menu)
          return menu.prev_menu and menu.prev_menu._win_configs.width + 1 or 0
        end,
      },
    },
    bar = {
      update_debounce = 100,
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        local utils = require("dropbar.utils")
        local filename = {
          get_symbols = function(buff, win, cursor)
            local path = sources.path.get_symbols(buff, win, cursor)
            return { path[#path] }
          end,
        }
        if vim.bo[buf].ft == "markdown" then
          return {
            filename,
            utils.source.fallback({
              sources.treesitter,
              sources.markdown,
              sources.lsp,
            }),
          }
        end
        return {
          filename,
          utils.source.fallback({
            sources.lsp,
            sources.treesitter,
          }),
        }
      end,
    },
  },
}

