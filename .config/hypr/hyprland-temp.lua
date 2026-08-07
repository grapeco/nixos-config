hl.monitor({
    output   = "",
    mode     = "highres",
    position = "auto",
    scale    = 1,
})

require("binds")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.config({
    debug = {
        disable_scale_checks = true,
    },
})

-- Autostart
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("systemctl --user start gammastep")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.config({
    general = {
        allow_tearing = true,
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        resize_on_border = true,
        layout = "dwindle",
        col = {
            active_border = "rgb({{base0D}})",
        },
    },
})

hl.config({
    decoration = {
        rounding = 10,
        blur = {
            enabled = false,
        },
        shadow = {
            enabled = false,
        },
    },
})

hl.curve(
    "md3_decel",
    { type = "bezier", points = { {0, 0}, {0.8, 0.15} } }
)

hl.curve(
    "menu_decel",
    { type = "bezier", points = { {0.1, 0.6}, {0, 1} } }
)

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "md3_decel", style = "popin 60%"})
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default"})
hl.animation({ leaf = "fade", enabled = 1, speed = 2, bezier = "md3_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "menu_decel", style = "slide" })

hl.config({
    cursor = {
        no_hardware_cursors = 2,
    },
})

hl.config({
    input = {
        kb_layout = "us, ru",
        kb_options = "grp:caps_toggle",
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 3,
    direction = "down",
    action = function() hl.exec_cmd("grimblast --notify --freeze copy screen") end 
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = 0.5,
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.window_rule({
    name  = "opacity",
    match = {
        class = ".*",
    },
    opacity = "0.9",
})

hl.window_rule({
    name  = "exeptions",
    match = {
        class = "io.bassi.Amberol|firefox|vesktop|org.gnome.eog|gimp",
    },
    opacity = "1.0",
})
