---@diagnostic disable: undefined-global

local gears = require("gears")
local awful = require("awful")
local helpers = require("helpers")
local fs = gears.filesystem

local airplane = {}

airplane.script_path = fs.get_configuration_dir() .. "scripts/airplane.sh"

function airplane._invoke_script(args, cb)
	awful.spawn.easy_async_with_shell(airplane.script_path .. " " .. args, function(out)
		if cb then
			cb(helpers.trim(out))
		end
	end)
end

function airplane.toggle()
	airplane._invoke_script("toggle")
end

return airplane
