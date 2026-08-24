-- Contains application definitions
 
local M = {}

M.alacritty = {
  exec = "alacritty",
  class = "Alacritty",
  workspace = 1
}

M.foot = {
  exec = "foot --login-shell tmux new -A -s helix",
  class = "foot",
  workspace = 1
}

M.foot_yazi = {
  exec = "foot --title=yazi --app-id=yazi yazi",
  class = "yazi",
  workspace = nil
}

M.foot_tmux_yazi = {
  exec = "foot --title=yazi --app-id=yazi tmux new -A -s yazi -c yazi",
  class = "yazi",
  workspace = nil
}

-- Rethink this. Maybe a shell script to select the terminal or run it?
M.foot_tmux_zk = {
  exec = "foot --title=zk --app-id=zk tmux -c 'zk edit --interactive'",
  class = "zk",
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

M.kitty_yazy = {
  exec = "kitty --title yazi --class yazi -e yazi",
  class = "yazi",
  workspace = nil
}

M.kitty_yazi_quick = {
  exec = "kitten quick-access-terminal yazi",
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
