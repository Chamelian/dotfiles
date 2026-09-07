-- Monitors
--
-- hl.monitor({
-- 	output = "DP-3",
-- 	mode = "5120x1440@240",
-- 	position = "0x0",
-- 	scale = 1.25,
-- })
-- hl.monitor({
-- 	output = "DP-1",
-- 	mode = "2560x1440@60",
-- 	position = "4096x0",
-- 	scale = 1.25,
-- })
-- hl.monitor({
-- 	output = "HDMI-A-1",
-- 	mode = "1280x720@60",
-- 	position = "4096x-1152",
-- 	scale = 1.25,
-- })
--
hl.monitor({
	output = "DP-1",
	mode = "2560x1440@165",
	position = "0x0",
	scale = 1.25,
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "2048x0",
	scale = 1.25,
})
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-- Binds
local mainMod = "SUPER"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
-- hl.bind(mainMod .. " + C", hl.dsp.window.kill({ window = "activewindow" }))
hl.bind(mainMod .. " + C", hl.dsp.window.close({ window = "activewindow" }))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle", window = "activewindow" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("wofi --normal-window drun"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo({ action = "toggle", window = "activewindow" }))
hl.bind(mainMod .. " + F11", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("thunderbird --calendar"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("kill -10 $(pgrep -f 'waybar/configurations/weather')"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("ALT + tab", hl.dsp.window.cycle_next())

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("xF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +1%"))
hl.bind("xF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -1%"))
hl.bind("xF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind("PRINT", hl.dsp.exec_cmd('grim -g "$(slurp)"'))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("grim"))

-- Window Rules
hl.window_rule({ match = { class = "^(kitty)$|^(pavucontrol)$" }, opacity = "1.0 0.75" })
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "1.0 0.9" })
hl.window_rule({ match = { class = "^(Code)$|^(nvim)(.*)$" }, opacity = "1.0 0.85" })
hl.window_rule({ match = { class = "^(thunar)$" }, opacity = "0.9 0.8" })

hl.window_rule({ match = { title = "^(Python Turtle Graphics)$" }, float = true })
hl.window_rule({ match = { class = "^(qalculate-gtk)$" }, float = true })
hl.window_rule({ match = { class = "^(org.prismlauncher.PrismLauncher)$" }, float = true })
hl.window_rule({ match = { title = "^(ALVR)(.*)$" }, float = true })

-- Workspace Rules
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1" })

hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })
hl.workspace_rule({ workspace = "7", monitor = "DP-1" })
hl.workspace_rule({ workspace = "9", monitor = "DP-1" })

-- hl.workspace_rule({ workspace = "0", monitor = "HDMI-A-1", default = true })

-- AutoStart
hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper & firefox & mako & corectrl")
	-- Main Waybar
	hl.exec_cmd(
		'waybar -c "$HOME/.config/waybar/configurations/bare/config" -s "$HOME/.config/waybar/configurations/bare/style.css"'
	)
	-- Weather Waybar
	hl.exec_cmd(
		'waybar -c "$HOME/.config/waybar/configurations/weather/config" -s "$HOME/.config/waybar/configurations/weather/style.css"'
	)

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)

-- ENVs
hl.env("XCURSOR_SIZE", "24")

-- Main Config
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,
		border_size = 2,
		col = {
			active_border = { colors = { "rgba(770b8cee)", "rgba(bd1dbfee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	input = {
		kb_layout = "us",
		repeat_delay = 300,
		repeat_rate = 30,
		follow_mouse = 1,
		sensitivity = 0.0,
		numlock_by_default = true,
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = true,
		enable_swallow = true,
	},
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
	dwindle = {
		preserve_split = true,
	},
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		blur = {
			enabled = true,
			size = 7,
			passes = 1,
			new_optimizations = true,
			ignore_opacity = true,
		},
	},
	animations = {
		enabled = true,
	},
	xwayland = {
		enabled = true,
		force_zero_scaling = true,
	},
})

-- Animations
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("exit", { type = "bezier", points = { { 0.9, -0.2 }, { 0.95, 0.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "exit", style = "slide" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })
