-- Lua Shard
-- Hyprland 0.55.0 Stable

local terminal = "kitty"
local fileManager = "dolphin"
local menu = "wofi --show drun"

local workspaces = 10

local function run(cmd, window_rules)
    return hl.dsp.exec_cmd(cmd, window_rules)
end

-- MONITORS
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- AUTOSTART
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("discord")
    hl.exec_cmd("dunst")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("nm-applet --indicator")
end)

-- CONFIG TABLE
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 3,
        ["col.active_border"] = "0xeeec2323",
        ["col.inactive_border"] = "rgba(202020aa)",
        layout = "dwindle"
    },
    decoration = {
        rounding = 5,
        blur = { enabled = true, size = 3, passes = 1 }
    },
    input = {
        kb_layout = "de",
        follow_mouse = 1
    }
})

-- KEYBINDINGS 
hl.bind("SUPER + Q", run(terminal))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + M", run("shutdown"))
hl.bind("SUPER + E", run(fileManager))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + R", run(menu))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

-- SCREENSHOT
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- BROWSER
hl.bind("SUPER + F", run("firefox &"))

-- WAYBAR RESTART
hl.bind("SUPER + SHIFT + SPACE",  run("killall waybar ; waybar &"))

-- FOCUS
hl.bind("SUPER + left", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "r" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "d" }))

-- WORKSPACE LOOP
-- Switch workspaces: SUPER + [1-workspaces]
-- Move active window to workspace: SUPER + SHIFT [1-workspaces]
-- Move active window to workspace and follow: SUPER + CTRL [1-workspaces]
for i = 1, workspaces do

    local key = i % 10 
    hl.bind("SUPER + " .. key,         hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false}))
    hl.bind("SUPER + CTRL + " .. key,  hl.dsp.window.move({ workspace = i }))

end

-- Multimedia
hl.bind("XF86AudioRaiseVolume", run("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", run("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", run("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

