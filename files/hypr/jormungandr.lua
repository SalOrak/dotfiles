-- Gaming


local libs = require('lib')
local withMod = libs.withMod
local apps = require('apps')

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "2560x1440@100",
    position = "auto",
    scale    = "1",
})

------------------
--- VARIABLES ----
------------------
 
local menu = wofi
local terminal = apps.alacritty
local browser = apps.librewolf
local fileManager = apps.yazi
local notes = apps.obsidian

---------------------
--- MOUSE BUTTONS ---
---------------------
local mouse_top_button = "mouse:276"
local mouse_bottom_button = "mouse:275"


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
 
hl.env("XCURSOR_SIZE", "24")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- EMPTY FOR NOW


--------------------
------ RULES -------
--------------------

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
 
---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(mouse_bottom_button, libs.switchBetweenApps(appOne, appTwo))
hl.bind(mouse_top_button, libs.switchBetweenApps(appOne, appTwo))

hl.bind(withMod("+ T"), libs.debugWindow)

-- Binds
hl.bind(withMod("+ Q"), libs.execOrFocus(terminal))
hl.bind(withMod("+ D"), libs.execOrFocus(browser))
hl.bind(withMod("+ R"), libs.execOrFocus(apps.godot))
hl.bind(withMod("+ A"), libs.execOrFocus(apps.obsidian))
hl.bind(withMod("+ E"), libs.execOrFocus(fileManager))

hl.bind(withMod("+ SPACE"), hl.dsp.exec_cmd(menu))

-- Dunst
hl.bind(withMod("+ X"), hl.dsp.exec_cmd("dunstctl close-all"))
hl.bind(withMod("+ SHIFT +X"), hl.dsp.exec_cmd("dunstctl set-paused toggle"))
hl.bind(withMod("+ G"), hl.dsp.exec_cmd("dunstctl close"))
hl.bind(withMod("+ N"), hl.dsp.exec_cmd("dunstctl history-pop"))

-- Screencapture binds
hl.bind(withMod("+ S"), libs.screenshot)
hl.bind(withMod("+ SHIFT + S"), libs.recordGif)


-- Example special workspace (scratchpad)
-- hl.bind(withMod(" + E"),         hl.dsp.workspace.toggle_special("keepass"))
-- hl.bind(withMod(" + SHIFT + S"), hl.dsp.window.move({ workspace = "special:magic" }))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("exec brightnessctl set 10%-"), {locked = true, repeating = true}) 
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("exec brightnessctl set 10%+"), {locked = true, repeating = true}) 


