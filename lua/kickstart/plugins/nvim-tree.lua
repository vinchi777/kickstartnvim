-- nvim-tree.lua is a file explorer tree for Neovim written in lua
-- https://github.com/nvim-tree/nvim-tree.lua

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>nn', '<cmd>NvimTreeToggle<CR>', desc = 'NvimTree toggle', silent = true },
    { '<leader>nr', '<cmd>NvimTreeFindFile<CR>', desc = 'NvimTree reveal file', silent = true },
    { '<leader>e', '<cmd>wincmd p<cr>', desc = 'Focus main editor', silent = true },
  },
  config = function()
    require('nvim-tree').setup({
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', '\\', api.tree.close, opts('Close'))
      end,
    })
  end,
}