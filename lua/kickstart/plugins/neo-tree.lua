-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>nn', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
    { '<leader>nr', ':Neotree reveal<CR>', desc = 'NeoTree reveal file', silent = true },
    { '<leader>e', '<cmd>wincmd p<cr>', desc = 'Focus main editor', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          -- vim.cmd [[
          -- setlocal relativenumber=false | setlocal number = false
          -- ]]
        end,
      },
    },
  },
}
