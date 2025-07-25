local beautiful = require("beautiful")
local gears = require("gears")

local function load_theme()
	beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/default/theme.lua")
end

load_theme()
