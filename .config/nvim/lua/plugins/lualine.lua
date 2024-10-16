-- Lualine
return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_x = { 'filetype' },
      },
      extensions = { 'fugitive', 'trouble', 'lazy', 'mason', 'nvim-tree' },
    },
  },
}
