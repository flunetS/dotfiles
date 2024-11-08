return {
    'rainbowhxch/beacon.nvim',
    event = 'VeryLazy',
    opts = {
      minimal_jump = 20,
      ignore_buffers = { 'terminal', 'nofile', 'neorg://Quick Actions' },
      ignore_filetypes = {
        'qf',
        'dap_watches',
        'dap_scopes',
        'neo-tree',
        'NeogitCommitMessage',
        'NeogitPopup',
        'NeogitStatus',
      },
    },
}