local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup{
  options = {
    icons_enabled=true,
    theme='auto',
  },
  sections = {
    lualine_a = {'mode'},

    lualine_b = {
      'branch',
      'diff',
      'diagnostics'},

      lualine_c = {
        {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } 
      },

      lualine_x = {
        {
          'diagnostics', 
          sources = { "nvim_diagnostic" },
          symbols = { 
            error = ' ', 
            warn = ' ',
            info = '🛈', 
            hint = ' ' }
          },
          'encoding',
          'filetype'
        },

      lualine_y = {'progress'},

      lualine_z = {'location'}
    }
  }
