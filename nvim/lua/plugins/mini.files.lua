return {
  "echasnovski/mini.files",
  version = false,
  opts = {
    windows = {
      preview = true,
      width_preview = 45,
    },
  },
  vim.keymap.set(
    "n",
    "-",
    ":lua MiniFiles.open()<CR>",
    { noremap = true, silent = true, desc = "MiniFile [E]xplorer" }
  ),
}
