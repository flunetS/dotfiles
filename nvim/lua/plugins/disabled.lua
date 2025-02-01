local isNeovide = vim.g.neovide

return {
  { "karb94/neoscroll.nvim", enabled = not isNeovide },
  { "rainbowhxch/beacon.nvim", enabled = not isNeovide },
  { "b0o/incline.nvim", enabled = false },
  { "nvim-focus/focus.nvim", enabled = false },
  { "Exafunction/codeium.vim", enabled = false },
  { "HiPhish/rainbow-delimiters.nvim", enabled = false },
  { "petertriho/nvim-scrollbar", enabled = false },
  -- { "Saghen/blink.cmp", enabled = false },
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false},
}
