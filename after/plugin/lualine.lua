require('lualine').setup {
  options = {
    theme = 'nordfox'
  },
  sections = {lualine_c = {require('auto-session.lib').current_session_name}},
}
