-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix for paths with symbols like "()"
-- require("telescope").setup({
--   pickers = {
--     find_files = {
--       hidden = true,
--       find_command = {
--         "rg",
--         "--files",
--         "--color=never",
--         "--no-heading",
--         "--line-number",
--         "--column",
--         "--smart-case",
--         "--hidden",
--         "--glob",
--         "!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
--         "--path-separator",
--         "/",
--       },
--     },
--   },
-- })

-- disable diagnostics for .env files
local lsp_hacks = vim.api.nvim_create_augroup("LspHacks", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = lsp_hacks,
  pattern = ".env*",
  callback = function(e)
    vim.diagnostic.enable(false, { bufnr = e.buf })
  end,
})

-- file renaming for mini.files
vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesActionRename",
  callback = function(event)
    Snacks.rename.on_rename_file(event.data.from, event.data.to)
  end,
})

-- Save on focus lost
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  command = "silent! wa",
})

-- Focus plugin
local ignore_filetypes = {
  ["neo-tree"] = true,
  ["dap-repl"] = true,
  ["neotest-summary"] = true,
  toggleterm = true,
  oil = true,
  SidebarNvim = true,
  trouble = true,
  terminal = true,
  dapui_console = true,
  dapui_watches = true,
  dapui_stacks = true,
  dapui_breakpoints = true,
  dapui_scopes = true,
  NeogitStatus = true,
  NeogitLogView = true,
  NeogitPopup = true,
  NeogitCommitMessage = true,
  OverseerList = true,
}

local function should_disable(buf, win)
  return ignore_filetypes[vim.bo[buf].filetype]
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf = args.buf
    if should_disable(buf) then
      vim.b[buf].focus_disable = true
    else
      vim.b[buf].focus_disable = nil
    end
  end,
})

for _, win in ipairs(vim.api.nvim_list_wins()) do
  local buf = vim.api.nvim_win_get_buf(win)
  if vim.api.nvim_win_get_config(win).zindex == nil and should_disable(buf, win) then
    vim.b[buf].focus_disable = true
  end
end

-- Neoscroll plugin
if not vim.g.neovide then
  local neoscroll = require("neoscroll")

  local keymap = {
    ["<C-u>"] = function()
      neoscroll.ctrl_u({ duration = 115 })
    end,
    ["<C-d>"] = function()
      neoscroll.ctrl_d({ duration = 115 })
    end,
  }

  local modes = { "n" }

  for key, func in pairs(keymap) do
    vim.keymap.set(modes, key, func)
  end
end

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
