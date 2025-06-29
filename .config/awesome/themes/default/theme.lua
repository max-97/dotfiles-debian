--------------------------------
--         Catppuccin         --
-- Theme adapted from ayamir. --
-- github.com/ayamir/dotfiles --
--------------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local gfs = require("gears.filesystem")

local dpi = xresources.apply_dpi

-- paths
local themes_path = os.getenv("HOME") .. "/.config/awesome/themes/"
local assets_path = gfs.get_configuration_dir() .. "assets/"

-- assets
local icons_path = assets_path .. "icons/"
local shapes_path = assets_path .. "shapes/"
local titlebar_assets_path = assets_path .. "titlebar/"

local theme = {}

theme.nerd_font = "JetBrainsMono Nerd Font"
theme.font_name = theme.nerd_font
theme.font_size = "10"
theme.font = theme.nerd_font .. " " .. theme.font_size
theme.material_icons = "Material Icons"

-- base colors
theme.black = "#1e1e2e"
theme.deep_black = "#181825"
theme.crust = "#11111b"
theme.surface0 = "#313244"
theme.grey = "#6e6c7c"
theme.white = "#d7dae0"
theme.light_white = "#fafafa"
theme.pink = "#f5c2e7"
theme.red = "#f38ba8"
theme.orange = "#fab387"
theme.yellow = "#f9e2af"
theme.green = "#a6e3a1"
theme.blue = "#89b4fa"
theme.purple = "#cba6f7"
theme.lavender = "#b4befe"

-- backgrounds
theme.bg_darker = theme.deep_black
theme.bg_normal = theme.black
theme.bg_contrast = theme.crust
theme.bg_lighter = theme.surface0

-- elements bg
theme.bg_focus = theme.deep_black
theme.bg_urgent = theme.white
theme.bg_minimize = theme.grey
theme.bg_systray = theme.black

-- foregrounds
theme.fg_normal = theme.white
theme.fg_focus = theme.purple
theme.fg_urgent = theme.red
theme.fg_minimize = theme.light_white

theme.dashboard_update_struts = true

theme.actions = {
	bg = theme.bg_normal,
	contrast = theme.bg_contrast,
	lighter = theme.bg_lighter,
	fg = theme.fg_normal,
}

-- bar
theme.bar_width = 43

-- borders and gaps
theme.border_width = dpi(0)
theme.border_color_normal = theme.blue
theme.border_color_active = theme.purple
theme.border_color_marked = theme.red
theme.border_radius = dpi(10)

theme.useless_gap = dpi(4)

-- tasklist
theme.tasklist_plain_task_name = true
theme.tasklist_bg = theme.bg_normal
theme.tasklist_bg_foxus = theme.bg_focus
theme.tasklist_bg_urgent = theme.red .. "4D"

-- taglist
theme.taglist_bg = theme.bg_normal
theme.taglist_bg_focus = theme.lavender
theme.taglist_bg_occupied = theme.grey
theme.taglist_bg_empty = theme.bg_darker

-- systray
theme.systray_icon_spacing = dpi(12)
theme.systray_max_rows = 7

-- menu
theme.menu_font = theme.font
theme.menu_submenu_icon = gears.color.recolor_image(shapes_path .. "triangle.png", theme.fg_normal)
theme.menu_height = dpi(40)
theme.menu_width = dpi(180)
theme.menu_bg_focus = theme.bg_lighter

-- titlebar
theme.titlebar_bg = theme.bg_contrast
theme.titlebar_bg_focus = theme.bg_normal
theme.titlebar_fg = theme.fg_normal

-- close button
theme.titlebar_close_button_normal = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.grey)
theme.titlebar_close_button_focus = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.red)

-- maximized
theme.titlebar_maximized_button_normal_active =
	gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.grey)
theme.titlebar_maximized_button_normal_inactive =
	gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.grey)
theme.titlebar_maximized_button_focus_active =
	gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.yellow)
theme.titlebar_maximized_button_focus_inactive =
	gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.yellow)

-- minimize
theme.titlebar_minimize_button_normal = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.grey)
theme.titlebar_minimize_button_focus = gears.color.recolor_image(titlebar_assets_path .. "circle.png", theme.green)

-- wallpaper
theme.wallpaper = themes_path .. "default/background.png"

-- layouts
theme.layout_fairh = gears.color.recolor_image(themes_path .. "default/layouts/fairhw.png", theme.fg_normal)
theme.layout_fairv = gears.color.recolor_image(themes_path .. "default/layouts/fairvw.png", theme.fg_normal)
theme.layout_floating = gears.color.recolor_image(themes_path .. "default/layouts/floatingw.png", theme.fg_normal)
theme.layout_magnifier = gears.color.recolor_image(themes_path .. "default/layouts/magnifierw.png", theme.fg_normal)
theme.layout_max = gears.color.recolor_image(themes_path .. "default/layouts/maxw.png", theme.fg_normal)
theme.layout_fullscreen = gears.color.recolor_image(themes_path .. "default/layouts/fullscreenw.png", theme.fg_normal)
theme.layout_tilebottom = gears.color.recolor_image(themes_path .. "default/layouts/tilebottomw.png", theme.fg_normal)
theme.layout_tileleft = gears.color.recolor_image(themes_path .. "default/layouts/tileleftw.png", theme.fg_normal)
theme.layout_tile = gears.color.recolor_image(themes_path .. "default/layouts/tilew.png", theme.fg_normal)
theme.layout_tiletop = gears.color.recolor_image(themes_path .. "default/layouts/tiletopw.png", theme.fg_normal)
theme.layout_spiral = gears.color.recolor_image(themes_path .. "default/layouts/spiralw.png", theme.fg_normal)
theme.layout_dwindle = gears.color.recolor_image(themes_path .. "default/layouts/dwindlew.png", theme.fg_normal)
theme.layout_cornernw = gears.color.recolor_image(themes_path .. "default/layouts/cornernww.png", theme.fg_normal)
theme.layout_cornerne = gears.color.recolor_image(themes_path .. "default/layouts/cornernew.png", theme.fg_normal)
theme.layout_cornersw = gears.color.recolor_image(themes_path .. "default/layouts/cornersww.png", theme.fg_normal)
theme.layout_cornerse = gears.color.recolor_image(themes_path .. "default/layouts/cornersew.png", theme.fg_normal)

-- icons
theme.launcher_icon = gears.color.recolor_image(icons_path .. "launcher.svg", theme.blue)
theme.menu_icon = gears.color.recolor_image(icons_path .. "menu.svg", theme.fg_normal)
theme.hints_icon = gears.color.recolor_image(icons_path .. "hints.svg", theme.blue)
theme.powerbutton_icon = gears.color.recolor_image(icons_path .. "poweroff.svg", theme.red)
theme.poweroff_icon = icons_path .. "poweroff.svg"

theme.volume_on = gears.color.recolor_image(icons_path .. "volume-on.svg", theme.fg_normal)
theme.volume_muted = gears.color.recolor_image(icons_path .. "volume-muted.svg", theme.fg_normal)

theme.network_connected = "\u{F05A9}"
theme.network_disconnected = "\u{F05AA}"

-- Variables set for theming notifications:
theme.notification_font = "JetBrainsMono Nerd Font 12"
theme.notification_margin = dpi(10)
theme.notification_border_color = theme.border_normal
theme.notification_border_width = theme.border_width
theme.notification_icon_size = dpi(60)

-- pfp
theme.pfp = assets_path .. "pfp.png"

-- fallback music
theme.fallback_music = assets_path .. "fallback-music.png"

-- fallback notification icon
theme.fallback_notif_icon = gears.color.recolor_image(icons_path .. "hints.svg", theme.blue)

-- disable icon theme
theme.icon_theme = nil
-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- task preview
theme.task_preview_widget_border_radius = dpi(7)
theme.task_preview_widget_bg = theme.bg_normal
theme.task_preview_widget_border_color = theme.bg_normal
theme.task_preview_widget_border_width = 0
theme.task_preview_widget_margin = dpi(10)

-- tag preview
theme.tag_preview_widget_border_radius = dpi(7)
theme.tag_preview_client_border_radius = dpi(7)
theme.tag_preview_client_opacity = 0.5
theme.tag_preview_client_bg = theme.bg_lighter
theme.tag_preview_client_border_color = theme.blue
theme.tag_preview_client_border_width = 1
theme.tag_preview_widget_bg = theme.bg_normal
theme.tag_preview_widget_border_color = theme.bg_normal
theme.tag_preview_widget_border_width = 0
theme.tag_preview_widget_margin = dpi(7)

-- tooltip
theme.tooltip_bg = theme.bg_normal
theme.tooltip_fg = theme.fg_normal

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
