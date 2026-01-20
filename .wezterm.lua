local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Esquema de colores
config.color_scheme = 'Kanagawa Dragon (Gogh)'

-- Fuente
config.font = wezterm.font('JetBrains Mono')
config.font_size = 11.0

-- Ventana
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.98
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Pestañas
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = false
config.colors = {
  tab_bar = {
    background = 'rgba(24, 22, 22, 0.98)',
    active_tab = {
      bg_color = 'rgba(0, 0, 0, 0)',
      fg_color = '#c5c9c5',
    },
    inactive_tab = {
      bg_color = 'rgba(0, 0, 0, 0)',
      fg_color = '#727169',
    },
  },
}
status_update_interval = 300
wezterm.on('format-tab-title', function(tab)
  return { { Text = '' } }
end)

wezterm.on('update-status', function(window, pane)
  local title = pane:get_title()
  local width = window:get_dimensions().cols or 80
  local padding = math.max(0, math.floor((width - #title) / 2))
  window:set_left_status(wezterm.format({
    { Foreground = { Color = '#c5c9c5' } },
    { Text = string.rep(' ', padding) .. title },
  }))
end)




-- Cursor
config.default_cursor_style = 'BlinkingBar'

return config
