-- Contains application definitions
 
local M = {}

M.alacritty = {
  exec = "alacritty",
  class = "Alacritty",
  workspace = 1
}

M.yazi = {
  exec = "kitty --title yazi --class yazi -e yazi",
  class = "yazi",
  workspace = nil
}

M.kitty =  {
  exec = "kitty --class=kitty --single-instance",
  class = "kitty",
  workspace = 1
}

M.kitty_hx =  {
  exec = "kitty --class=_helix --single-instance --listen-on=unix:/tmp/kitty-helix hx",
  class = "_helix",
  workspace = 1
}

M.yazi_quick = {
  exec = "kitten quick-access-terminal",
  class = "yazi_quick",
  workspace = nil
}

M.librewolf = {
  exec = "librewolf",
  class = "librewolf",
  workspace = 2
}

M.godot = {
  exec = "godot4.6",
  class = "org.godotengine.Editor",
  workspace = 3
}

M.obsidian = {
  exec = "obsidian",
  class = "obsidian",
  workspace = 4
}

return M
