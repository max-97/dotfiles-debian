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
		shape = helpers.mkroundedrect(),
		bg = beautiful.bg_contrast,
		widget = wibox.container.background,
		set_value = function(self, value)
			self:get_children_by_id("variable")[1].markup = value
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

awesome.connect_signal("cpu::percent", function(percent)
	cpu_usage.value = percent .. "%"
end)

awesome.connect_signal("ram::used", function(percent)
	local trimmed = percent:match("^%s*(.-)%s*$")
	ram_usage.value = trimmed .. "%"
end)

awesome.connect_signal("temperature::value", function(temp)
	temperature.value = math.floor(temp) .. "°C"
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
	}

	for _, sysinfo in ipairs(systeminfo.dict) do
		table.insert(widget_template, sysinfo)
	end

	return wibox.widget(widget_template)
end

return systeminfo
