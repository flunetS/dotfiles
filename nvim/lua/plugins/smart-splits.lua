return {
    'mrjones2014/smart-splits.nvim',
    opts = {},
    keys = {
      -- resizing splits
      { '<A-Left>', function() require('smart-splits').resize_right() end },
      { '<A-Right>', function() require('smart-splits').resize_left() end },
      { '<C-Up>', function() require('smart-splits').resize_up() end },
      { '<C-Down>', function() require('smart-splits').resize_down() end },

      -- moving between splits
      { '<C-h>', function() require('smart-splits').move_cursor_left() end },
      { '<C-j>', function() require('smart-splits').move_cursor_down() end },
      { '<C-k>', function() require('smart-splits').move_cursor_up() end },
      { '<C-l>', function() require('smart-splits').move_cursor_right() end },

      -- swapping buffers between windows
      -- { '<leader><leader>h', function() require('smart-splits').swap_buf_left() end, desc = 'swap left' },
      -- { '<leader><leader>j', function() require('smart-splits').swap_buf_down() end, desc = 'swap down' },
      -- { '<leader><leader>k', function() require('smart-splits').swap_buf_up() end, desc = 'swap up' },
      -- { '<leader><leader>l', function() require('smart-splits').swap_buf_right() end, desc = 'swap right' },
    },
}