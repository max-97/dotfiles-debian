local beautiful = require("beautiful")
local wibox = require("wibox")
local helpers = require("helpers")

-- signals
require("signal.cpu")
require("signal.ram")
require("signal.temperature")

local function make_sysinfo(opts)
	local sysinfo = wibox.widget({
		{
			{
				markup = opts.icon,
				align = "center",
				font = beautiful.nerd_font .. " 17",
				widget = wibox.widget.textbox,
			},
			{
				id = "variable",
				markup = "0",
				align = "center",
				font = beautiful.nerd_font .. " 10",
				widget = wibox.widget.textbox,
			},
			spacing = beautiful.useless_gap,
			layout = wibox.layout.fixed.vertical,
		},
		widget = wibox.container.background,
		set_markup = function(self, value, color)
			local markup_text = string.format("<span foreground='%s'>%s</span>", color, value)
			self:get_children_by_id("variable")[1].markup = markup_text
		end,
	})

	return sysinfo
end

local cpu_usage = make_sysinfo({
	icon = "󰻠",
})

local ram_usage = make_sysinfo({
	icon = "",
})

local temperature = make_sysinfo({
	icon = "",
})

local function get_color(value)
	value = tonumber(value)
	local color = beautiful.green
	if value > 75 then
		color = beautiful.red
	elseif value > 50 then
		color = beautiful.yellow
	end
	return color
end

awesome.connect_signal("cpu::percent", function(percent)
	cpu_usage:set_markup(percent .. "%", get_color(percent))
end)

awesome.connect_signal("ram::used", function(percent)
	local trimmed = percent:match("^%s*(.-)%s*$")
	ram_usage:set_markup(trimmed .. "%", get_color(trimmed))
end)

awesome.connect_signal("temperature::value", function(temp)
	temp = math.floor(temp)
	temperature:set_markup(temp .. "°C", get_color(temp))
end)

local systeminfo = {}

systeminfo.dict = {
	cpu_usage,
	ram_usage,
	temperature,
}

systeminfo.get_info_widget = function()
	local widget_template = {
		layout = wibox.layout.fixed.vertical,
		spacing = 5,
		shape = helpers.mkroundedrect(),
		bg = beautiful.bg_contrast,
	}

	for _, sysinfo in ipairs(systeminfo.dict) do
		table.insert(widget_template, sysinfo)
	end

	return wibox.widget(widget_template)
end

return systeminfo
