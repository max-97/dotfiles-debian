---@diagnostic disable: undefined-global
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

local systeminfo = require("ui.bar.modules.systeminfo")
local gettaglist = require("ui.bar.modules.tags")
local systray_toggler = require("ui.bar.modules.systray_toggler")
local dashboard_toggler = require("ui.bar.modules.dashboard_toggler")
local actions = require("ui.bar.modules.actions")
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
						{
							systray_toggler,
							dashboard_toggler,
							spacing = 9,
							layout = wibox.layout.fixed.vertical,
						},
						{
							actions,
							bottom = 6,
							widget = wibox.container.margin,
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
		minimum_height = s.geometry.height - beautiful.useless_gap * 4,
		minimum_width = beautiful.bar_width,
		bg = beautiful.bg_normal .. "00",
		fg = beautiful.fg_normal,
		widget = bar_content,
		screen = s,
		placement = function(d)
			return awful.placement.left(d, {
				margins = {
					left = beautiful.useless_gap * 2,
				},
			})
		end,
	})

	bar:struts({
		left = beautiful.bar_width + beautiful.useless_gap * 2,
	})
end)
