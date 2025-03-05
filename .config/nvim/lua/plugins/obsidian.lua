local main_vault_path = '/mnt/ssd/obsidian-vault'

-- Autoinsert template on note creation
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = main_vault_path .. '/*.md',
  group = vim.api.nvim_create_augroup('ObsidianInsertTemplate', { clear = true }),
  callback = function()
    vim.api.nvim_command 'ObsidianTemplate Template - Note'
  end,
})

-- Keymaps only for markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  group = vim.api.nvim_create_augroup('ObsidianSpecificMappings', { clear = true }),
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = '[O]bsidian [B]acklinks' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ot', '<cmd>ObsidianTags<CR>', { desc = '[O]bsidian [T]ags' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ol', '<cmd>ObsidianLinks<CR>', { desc = '[O]bsidian outgoing [L]inks' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>or', '<cmd>ObsidianRename<CR>', { desc = '[O]bsidian [R]ename note' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>it', 'ggdd<cmd>ObsidianTemplate Template - Note<CR>', { desc = '[I]nsert [T]emplate' })
    vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ii', '<cmd>ObsidianPasteImg<CR>', { desc = '[I]nsert [I]mage' })
  end,
})

return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'vault',
          path = main_vault_path,
        },
        {
          name = 'test',
          path = '/mnt/ssd/obsidian-vault-test',
        },
      },
      completion = { min_chars = 0 },
      mappings = {
        ['gd'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ['<leader>sf'] = {
          action = function()
            vim.api.nvim_command 'ObsidianQuickSwitch'
          end,
          opts = { noremap = false, buffer = true },
        },
      },
      note_id_func = function(title)
        return title
      end,
      disable_frontmatter = true,
      templates = { folder = 'Templates' },
      attachments = { img_folder = 'Attachments' },
    },
  },
}
