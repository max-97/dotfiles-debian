---@diagnostic disable: undefined-global
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")

local color = require("modules.color")
local rubato = require("modules.rubato")
local screenshot = require("modules.screenshot")

local gfs = gears.filesystem
local util = require("ui.dashboard.modules.util")

-- signals
local network_signal = require("signal.network")
local airplane_signal = require("signal.airplane")
local redshift_signal = require("signal.redshift")
local bluetooth_signal = require("signal.bluetooth")
local mic_signal = require("signal.mic")

-- helper
local function mkactionicon(icon, font)
	return wibox.widget({
		{
			{
				id = "icon_role",
				markup = icon,
				font = font and font or beautiful.nerd_font .. " 22",
				widget = wibox.widget.textbox,
			},
			halign = "center",
			valign = "center",
			layout = wibox.container.place,
		},
		id = "background_role",
		fg = beautiful.fg_normal,
		bg = beautiful.crust,
		shape = gears.shape.circle,
		forced_height = 48,
		forced_width = 48,
		widget = wibox.container.background,
		set_active = function(self, is_active)
			local background = self:get_children_by_id("background_role")[1]

			local blue = color.color({ hex = beautiful.blue })
			local dimblack = color.color({ hex = beautiful.crust })

			-- method -> rgb
			local by_percent = color.transition(dimblack, blue, 0)

			if not self.fading then
				self.fading = rubato.timed({
					duration = 0.30,
				})

				self.fading:subscribe(function(percent)
					background.bg = by_percent(percent / 100).hex
				end)
			end

			if is_active then
				self.fading.target = 100 -- go to blue
				background.fg = beautiful.bg_normal
			else
				self.fading.target = 0 -- go to dimblack
				background.fg = beautiful.fg_normal
			end
		end,
		set_icon = function(self, new_icon)
			self:get_children_by_id("icon_role")[1].markup = new_icon
		end,
		set_font = function(self, new_font)
			self:get_children_by_id("icon_role")[1].font = new_font
		end,
	})
end

-- actions buttons
local network = mkactionicon(beautiful.network_connected)

network:add_button(awful.button({}, 1, function()
	awful.spawn("nm-connection-editor")
end))

awesome.connect_signal("network::connected", function(is_connected)
	network.active = is_connected
	network.icon = is_connected and beautiful.network_connected or beautiful.network_disconnected
end)

local volume = mkactionicon("")

volume:add_button(awful.button({}, 1, function()
	VolumeSignal.toggle_muted()
end))

awesome.connect_signal("volume::muted", function(is_muted)
	volume.active = not is_muted
	volume.icon = is_muted and "🔇" or ""
end)

local airplane = mkactionicon("\u{F001D}")

airplane:add_button(awful.button({}, 1, function()
	airplane_signal.toggle()
end))

awesome.connect_signal("airplane::enabled", function(enabled)
	airplane.active = enabled
	airplane.icon = enabled and "\u{F001D}" or "\u{F001E}"
end)

local redshift = mkactionicon("\u{F0599}")

redshift:add_button(awful.button({}, 1, function()
	redshift_signal.toggle()
end))

awesome.connect_signal("redshift::active", function(enabled)
	redshift.active = enabled
	redshift.icon = enabled and "" or "\u{F0599}"
end)

local bluetooth = mkactionicon("\u{F00AF}", beautiful.nerd_font .. " 19")

bluetooth:add_button(awful.button({}, 1, function()
	bluetooth_signal.toggle()
end))

awesome.connect_signal("bluetooth::enabled", function(enabled)
	bluetooth.active = enabled
	bluetooth.icon = enabled and "\u{F00AF}" or "\u{F00B2}"
	if enabled then
		bluetooth.font = beautiful.nerd_font .. " 16"
	else
		bluetooth.font = beautiful.nerd_font .. " 19"
	end
end)

local mic = mkactionicon("", beautiful.nerd_font .. " 24")

mic:add_button(awful.button({}, 1, function()
	mic_signal.toggle()
end))

awesome.connect_signal("mic::active", function(enabled)
	mic.active = enabled
	mic.icon = enabled and "" or ""
	if enabled then
		mic.font = beautiful.nerd_font .. " 24"
	else
		mic.font = beautiful.nerd_font .. " 24"
	end
end)

local fully_screenshot = mkactionicon("\u{F0293}")

fully_screenshot:add_button(awful.button({}, 1, function()
	screenshot.full({ notify = true })
end))

local area_screenshot = mkactionicon("\u{F0A6D}")

area_screenshot:add_button(awful.button({}, 1, function()
	screenshot.area({ notify = true })
end))

-- main widget
return util.make_card({
	{
		{
			markup = "Actions",
			align = "start",
			widget = wibox.widget.textbox,
		},
		fg = beautiful.dimblack,
		widget = wibox.container.background,
	},
	{
		{
			{
				network,
				volume,
				airplane,
				redshift,
				spacing = beautiful.useless_gap * 2,
				layout = wibox.layout.flex.horizontal,
			},
			{
				bluetooth,
				mic,
				fully_screenshot,
				area_screenshot,
				spacing = beautiful.useless_gap * 2,
				layout = wibox.layout.flex.horizontal,
			},
			spacing = beautiful.useless_gap * 2,
			layout = wibox.layout.fixed.vertical,
		},
		margins = beautiful.useless_gap * 2,
		widget = wibox.container.margin,
	},
	spacing = beautiful.useless_gap * 2,
	layout = wibox.layout.fixed.vertical,
})
