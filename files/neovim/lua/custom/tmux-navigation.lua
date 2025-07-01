local tmux_cmd = "tmux select-pane "
local PaneDirections = {
	Up = "-U",
	Down = "-D",
	Left = "-L", 
	Right = "-R" 
}

function tmux_select_pane(pane)
	local pane_direction = nil
	for key, value in pairs(PaneDirections) do
		if pane == key then
			pane_direction = value 
		end
	end
	if pane_direction then
		local res = os.execute(tmux_cmd .. pane_direction)
		print("Status code: " .. res)
	end
end

