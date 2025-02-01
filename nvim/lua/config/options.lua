-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

require("luau-lsp").setup({
  platform = {
    type = "roblox",
  },
  types = {
    roblox_security_level = "PluginSecurity",
  },
})

vim.o.mousemoveevent = true

if vim.g.neovide then
  vim.g.neovide_transparency = vim.g.gui_transparency_default

  vim.g.neovide_scale_factor = 0.75

  vim.g.neovide_cursor_vfx_mode = "none"
  vim.g.neovide_cursor_trail_size = 0.18
  vim.g.neovide_cursor_animation_length = 0.07
  vim.g.neovide_touch_drag_timeout = 0.20
  vim.g.neovide_scroll_animation_length = 0.20

  vim.g.remember_window_size = true
  vim.g.remember_window_position = true

  vim.g.gui_font_default_size = 11
  vim.g.gui_font_size = vim.g.gui_font_default_size
  vim.opt.guifont = "JetBrainsMonoNL Nerd Font"

  local function toggle_transparency()
    if vim.g.neovide_transparency == 1.0 then
      vim.cmd("let g:neovide_transparency=0.93")
    else
      vim.cmd("let g:neovide_transparency=1.0")
    end
  end

  local function toggle_fullscreen()
    if vim.g.neovide_fullscreen == false then
      vim.cmd("let g:neovide_fullscreen=v:true")
    else
      vim.cmd("let g:neovide_fullscreen=v:false")
    end
  end

  vim.keymap.set("n", "<F11>", toggle_fullscreen, { silent = true })
  vim.keymap.set("n", "<F10>", toggle_transparency, { silent = true })
end
