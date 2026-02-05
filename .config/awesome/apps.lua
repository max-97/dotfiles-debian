local menubar = require("menubar")

terminal = "alacritty"
-- TODO maybe use other explorer
explorer = "nautilus"
browser = "flatpak run com.brave.Browser"
music = "flatpak run com.spotify.Client"
-- TODO install and setup rofi
-- launcher = "rofi -show drun"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

menubar.utils.terminal = terminal
