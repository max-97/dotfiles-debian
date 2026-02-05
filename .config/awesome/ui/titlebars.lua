local awful = require("awful")
local wibox = require("wibox")
local helpers = require("helpers")

client.connect_signal("request::titlebars", function(c)
	if c.requests_no_titlebar then
		return
	end

	local titlebar = awful.titlebar(c, {
		position = "top",
		size = 32,
	})

	local titlebars_buttons = {
		awful.button({}, 1, function()
			c:activate({
				context = "titlebar",
				action = "mouse_move",
			})
		end),
		awful.button({}, 3, function()
			c:activate({
				context = "titlebar",
				action = "mouse_resize",
			})
		end),
	}

	-- drag & resize area for titlebar
	local buttons_loader = {
		layout = wibox.layout.fixed.vertical,
		buttons = titlebars_buttons,
	}

	local top_bottom_margin = 10
	local left_right_margin = 5

	titlebar:setup({
		buttons_loader,
		buttons_loader,
		{
			helpers.apply_margin(awful.titlebar.widget.minimizebutton(c), {
				left = left_right_margin,
				right = left_right_margin,
				top = top_bottom_margin,
				bottom = top_bottom_margin,
			}),
			helpers.apply_margin(awful.titlebar.widget.maximizedbutton(c), {
				left = left_right_margin,
				right = left_right_margin,
				top = top_bottom_margin,
				bottom = top_bottom_margin,
			}),
			helpers.apply_margin(awful.titlebar.widget.closebutton(c), {
				left = left_right_margin,
				right = 10,
				top = top_bottom_margin,
				bottom = top_bottom_margin,
			}),
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	})
end)
