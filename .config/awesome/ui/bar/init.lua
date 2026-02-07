---@diagnostic disable: undefined-global
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local helpers = require("helpers")

local systeminfo = require("ui.bar.modules.systeminfo")
local gettaglist = require("ui.bar.modules.tags")
local systray_toggler = require("ui.bar.modules.systray_toggler")
local dashboard_toggler = require("ui.bar.modules.dashboard_toggler")
local clock = require("ui.bar.modules.date")
local getlayoutbox = require("ui.bar.modules.layoutbox")
local powerbutton = require("ui.bar.modules.powerbutton")

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[6])

	local bar_content = wibox.widget({
		{
			{
				{
					systeminfo.get_info_widget(),
					top = 7,
					widget = wibox.container.margin,
				},
				nil,
				{
					{
						nil,
						{
							systray_toggler,
							dashboard_toggler,
							spacing = 2,
							layout = wibox.layout.fixed.vertical,
						},
						{
							clock,
							getlayoutbox(s),
							powerbutton,
							spacing = 2,
							layout = wibox.layout.fixed.vertical,
						},
						layout = wibox.layout.fixed.vertical,
					},
					top = 5,
					bottom = 5,
					widget = wibox.container.margin,
				},
				layout = wibox.layout.align.vertical,
			},
			{
				gettaglist(s),
				halign = "center",
				valign = "center",
				layout = wibox.container.place,
			},
			layout = wibox.layout.stack,
		},
		bg = beautiful.bg_normal,
		fg = beautiful.fg_normal,
		widget = wibox.container.background,
	})

	local bar = awful.popup({
		visible = true,
		ontop = false,
		minimum_height = s.geometry.height,
		minimum_width = beautiful.bar_width,
		bg = beautiful.bg_normal .. "00",
		fg = beautiful.fg_normal,
		widget = bar_content,
		screen = s,
		placement = function(d)
			return awful.placement.left(d, {
				margins = {
					left = 0,
				},
			})
		end,
	})

	bar:struts({
		left = beautiful.bar_width,
	})
end)
