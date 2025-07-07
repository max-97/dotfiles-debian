local menubar = require("menubar")

terminal = "alacritty"
-- TODO maybe use other explorer
explorer = "nautilus"
browser = "brave-browser"
music = "spotify"
-- TODO install and setup rofi
-- launcher = "rofi -show drun"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

menubar.utils.terminal = terminal
