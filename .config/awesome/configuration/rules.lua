local ruled = require("ruled")
local awful = require("awful")
local helpers = require("helpers")

local function setup_rules()
	ruled.client.connect_signal("request::rules", function()
		-- All clients will match this rule.
		ruled.client.append_rule({
			id = "global",
			rule = {},
			properties = {
				focus = awful.client.focus.filter,
				raise = true,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
				maximized = false,
				floating = false,
				shape = helpers.mkroundedrect(12),
			},
		})

		-- Add titlebars to normal clients and dialogs
		ruled.client.append_rule({
			id = "titlebars",
			rule_any = { type = { "normal", "dialog" } },
			properties = { titlebars_enabled = true },
		})
	end)

	ruled.notification.connect_signal("request::rules", function()
		-- All notifications will match this rule.
		ruled.notification.append_rule({
			rule = {},
			properties = {
				screen = awful.screen.preferred,
				implicit_timeout = 5,
			},
		})
	end)
end

setup_rules()
