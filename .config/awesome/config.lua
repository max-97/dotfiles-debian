local apps = {
	launcher = "rofi -show-icons -modi windowcd,window,drun -show drun -filter ",
	-- xrandr = "lxrandr",
	-- screenshot = "scrot -e 'echo $f'",
	-- volume = "pavucontrol",
	-- appearance = "lxappearance",
	browser = "brave-browser",
	fileexplorer = "nautilus",
	editor = "nvim",
	settings = "nvim /home/.dotfiles/.config/awesome/rc.lua",
}

local terminal_cmds = {
	{
		cmd = "ls",
	},
	{
		cmd = 'sh chat-gpt "Describe cons and pros of awesomewm." 1.0',
		timeout = 100000,
	},
	{
		cmd = 'sh chat-gpt "${input}" 1.0',
		timeout = 100000,
		prompt = "Enter question for chat-gpt:",
	},
	{
		cmd = 'echo "${input}"',
		prompt = "Enter text for echo:",
	},
}

local user = {
	terminal = "alacritty",
}

local config = {
	apps = apps,
	user = user,
	terminal_cmds = terminal_cmds,
	weather_coordinates = { 49.261749, 13.903450 },
	dashboard_monitor_storage = { "/", "/home", "/efi", "/tmp" },
	main_panel = "wibar", -- variants: wibar, polybar, none
	--{{{ Features Activity
	dashboard_enabled = true,
	collage_enabled = true,
	desktop_enabled = false,
	active_corners_enabled = true,
	--}}}
}

return config
