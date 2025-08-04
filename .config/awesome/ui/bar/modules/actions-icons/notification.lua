---@diagnostic disable: undefined-global
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

local notification = wibox.widget({
	widget = wibox.widget.textbox,
	font = beautiful.nerd_font .. " 15",
	align = "center",
	markup = "🛈",
})

notification:add_button(awful.button({}, 1, function()
	awesome.emit_signal("notifcenter::toggle")
end))

return notification
