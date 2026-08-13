hl.monitor({
    output   = "",
    mode     = "highres",
    position = "auto",
    scale    = 1,
})

require("binds")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
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

hl.curve("linear",        { type = "bezier", points = { {0, 0},       {0.8, 0.15} } })
hl.curve("md3_standart",  { type = "bezier", points = { {0.2, 0},     {0, 1} } })
hl.curve("md3_decel",     { type = "bezier", points = { {0.05, 0.54}, {0.07, 1} } })
hl.curve("md3_accel",     { type = "bezier", points = { {0.3, 0},     {0.8, 0.15} } })
hl.curve("overshot",      { type = "bezier", points = { {0.05, 0.54}, {0.1, 1.1} } })
hl.curve("crazyshot",     { type = "bezier", points = { {0.1, 0.9},   {0.76, 0.92} } })
hl.curve("menu_decel",    { type = "bezier", points = { {0.1, 0.6}, {0, 1} } })
hl.curve("menu_accel",    { type = "bezier", points = { {0.38, 0.024}, {1, 0.07} } })
hl.curve("easeInOutCirc", { type = "bezier", points = { {0.85, 0},    {0.15, 1} } })
hl.curve("easeOutCirc",   { type = "bezier", points = { {0, 0.33},    {0.45, 1} } })
hl.curve("easeOutExpo",   { type = "bezier", points = { {0.16, 0.6},  {0.3, 1} } })
hl.curve("softAcDecel",   { type = "bezier", points = { {0.26, 0.156}, {0.15, 1} } })
hl.curve("md2",           { type = "bezier", points = { {0.4, 0},     {0.2, 1} } })

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "md3_decel", style = "popin 60%"})
hl.animation({ leaf = "windowsIn", enabled = true, speed = 2, bezier = "md3_decel", style = "popin 60%"})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "md3_decel", style = "popin 60%"})
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default"})
hl.animation({ leaf = "fade", enabled = 1, speed = 2, bezier = "md3_decel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 2, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, bezier = "menu_decel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2.5, bezier = "md3_decel", style = "slidevert" })

hl.config({
    cursor = {
        no_hardware_cursors = 1,
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
    opacity = "0.95 0.95 1.0",
})

hl.window_rule({
    name  = "exeptions",
    match = {
        class = "io.bassi.Amberol|firefox|vesktop|org.gnome.eog|gimp",
    },
    opacity = "1.0 1.0 1.0",
})
