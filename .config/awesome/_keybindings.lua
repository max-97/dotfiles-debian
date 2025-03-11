local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local menubar = require("menubar")

-- {{{ Mouse bindings
awful.mouse.append_global_mousebindings({
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewprev),
	awful.button({}, 5, awful.tag.viewnext),
})

-- }}}
-- Personal Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "b", function()
		awful.screen.focused().mywibox.visible = not awful.screen.focused().mywibox.visible
	end, { description = "wi(b)ar toggle", group = "awesome" }),
	awful.key({ modkey }, "z", function()
		awesome.emit_signal("dashboard::toggle")
	end, { description = "dashboard toggle", group = "awesome" }),

	-- user directory wallpapers change by keybindings - NEXT/PREVIOUS WALLPAPER
	awful.key({ modkey, altkey }, "w", function()
		beautiful.change_wallpaper_user(1)
	end, { description = "set next user wallpaper", group = "awesome" }),
	awful.key({ modkey, ctrlkey }, "w", function()
		beautiful.change_wallpaper_user(-1)
	end, { description = "set previous user wallpaper", group = "awesome" }),

	-- colorscheme directory wallpapers change by keybindings - NEXT/PREVIOUS WALLPAPER
	awful.key({ modkey, altkey }, "c", function()
		beautiful.change_wallpaper_colorscheme(1)
	end, { description = "set next colorscheme wallpaper", group = "awesome" }),
	awful.key({ modkey, ctrlkey }, "c", function()
		beautiful.change_wallpaper_colorscheme(-1)
	end, { description = "set previous colorscheme wallpaper", group = "awesome" }),

	-- resize clients with arrows
	awful.key({ modkey, altkey }, "Right", function()
		awful.tag.incmwfact(0.05)
	end, { description = "layout.extends right", group = "layout" }),
	awful.key({ modkey, altkey }, "Left", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "layout.extends left", group = "layout" }),
	awful.key({ modkey, altkey }, "Up", function()
		awful.tag.incmwfact(0.05)
	end, { description = "layout.extends up", group = "layout" }),
	awful.key({ modkey, altkey }, "Down", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "layout.extends down", group = "layout" }),

	-- swap client with arrows
	awful.key({ modkey, "Shift" }, "Right", function()
		awful.client.swap.byidx(1)
	end, { description = "layout.client.swap right", group = "layout" }),
	awful.key({ modkey, "Shift" }, "Left", function()
		awful.client.swap.byidx(-1)
	end, { description = "layout.client.swap left", group = "layout" }),
	awful.key({ modkey, "Shift" }, "Up", function()
		awful.client.swap.byidx(1)
	end, { description = "layout.client.swap up", group = "layout" }),
	awful.key({ modkey, "Shift" }, "Down", function()
		awful.client.swap.byidx(-1)
	end, { description = "layout.client.swap down", group = "layout" }),

	-- focus client with arrows
	awful.key({ modkey, ctrlkey }, "Right", function()
		awful.client.focus.bydirection("right")
	end, { description = "layout.client.focus right", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "Left", function()
		awful.client.focus.bydirection("left")
	end, { description = "layout.client.focus left", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "Up", function()
		awful.client.focus.bydirection("up")
	end, { description = "layout.client.focus up", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "Down", function()
		awful.client.focus.bydirection("down")
	end, { description = "layout.client.focus down", group = "layout" }),

	awful.key({ "Shift" }, "Alt_L", function()
		beautiful.mykeyboardlayout.next_layout()
	end),

	-- Print Screen
	awful.key({}, "Print", function()
		awful.spawn("flameshot gui")
	end, { description = "Make screenshot by flameshot", group = "awesome" }),

	-- Lock Support
	awful.key({ modkey }, "Home", function()
		awful.spawn("lock.sh")
	end, { description = "Lock Screen", group = "awesome" }),
	awful.key({ modkey }, "F10", function()
		awful.spawn("poweroff")
	end, { description = "Suspend Computer", group = "awesome" }),

	-- Rofi Support
	awful.key({ modkey }, "s", function()
		awful.spawn("rofi -show-icons -modi windowcd,window,drun -show drun")
	end, { description = "show rofi drun", group = "launcher" }),
	awful.key({ modkey, altkey }, "p", function()
		awful.spawn.with_shell("rofi-pass -t")
	end, { description = "types password from pass", group = "launcher" }),
	awful.key({ modkey, ctrlkey }, "p", function()
		awful.spawn.with_shell("rofi-pass")
	end, { description = "copy password from pass", group = "launcher" }),

	-- Widgets popups
	awful.key({ modkey }, "h", function()
		if beautiful.fs then
			beautiful.fs.show(7)
		end
	end, { description = "show filesystem", group = "widgets" }),
})

-- General Awesome keys
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, ctrlkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "q", function()
		awesome.emit_signal("exit_screen::toggle")
	end, { description = "exit screen", group = "awesome" }),
	awful.key({ modkey }, "c", function()
		beautiful.menu_colorschemes_create():toggle()
	end, { description = "show colorschemes menu", group = "awesome" }),
	awful.key({ modkey }, "x", function()
		beautiful.menu_portrait_create():toggle()
	end, { description = "show portrait menu for love tag", group = "awesome" }),
	awful.key({ modkey }, "a", function()
		awful.spawn("clipmenu")
	end, { description = "clipboard history by rofi/clipmenud", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.menu.client_list({ theme = { width = 250 } })
	end, { description = "show client list", group = "awesome" }),
	awful.key({ modkey, ctrlkey }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey, ctrlkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal (alacritty)", group = "launcher" }),
	awful.key({ modkey, altkey }, "Return", function()
		awful.spawn(terminal2)
	end, { description = "open a terminal2 (wezterm)", group = "launcher" }),
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),
	awful.key({ modkey }, "p", function()
		menubar.show()
	end, { description = "show the d-menu", group = "launcher" }),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),
	awful.key({ modkey, ctrlkey }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, ctrlkey }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey, ctrlkey }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:activate({ raise = true, context = "key.unminimize" })
		end
	end, { description = "restore minimized", group = "client" }),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, ctrlkey }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),
})

-- {{ Personal keybindings
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		-- show/hide titlebar
		awful.key({ modkey }, "t", awful.titlebar.toggle, { description = "Show/Hide Titlebars", group = "client" }),
	})
end)
--}}
--
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, ctrlkey },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey, ctrlkey }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),
		awful.key({ modkey }, "n", function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end, { description = "minimize", group = "client" }),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		awful.key({ modkey, ctrlkey }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),
		awful.key({ modkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" }),
	})
end)
