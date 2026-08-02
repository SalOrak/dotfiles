-- Library

local M = {}


---@class AppTable
---@field  exec string 
---@field  class string 
---@field  workspace number
 
M.withMod = function(bind)
	return "SUPER " .. bind
end

M.execOrFocus  = function(app)
	return function()
		for _, w in ipairs(hl.get_windows()) do
			if w.class == app.class then
				hl.dispatch(hl.dsp.focus({window = w, workspace = app.workspace}))
				return
			end
		end

		if app.workspace then
  		hl.dispatch(hl.dsp.focus({workspace = app.workspace}))
		end

		hl.dispatch(hl.dsp.exec_cmd(app.exec))
	end
end

M.debugWindow  = function()
	local currwin = hl.get_active_window()
	if currwin then
		local text = string.format("Class %s | title %s", currwin.class, currwin.title)
    hl.notification.create({text = text, duration = 5000})
	end
end

---@param app_one AppTable
---@param app_two AppTable
M.switchBetweenApps = function(app_one, app_two)

	return function()
		local switch_to = app_one.class
		local app = app_one.exec
		local ws = app_one.workspace

		if hl.get_active_window().class == app_one.class then
			switch_to  = app_two.class
			app = app_two.exec
			ws = app_two.workspace
		end

		local is_running = false
		local running_window = nil
		for _, w in ipairs(hl.get_windows()) do
			if (switch_to == w.class) then
				is_running = true
				running_window = w
				break
			end
		end

		if is_running then
			hl.dispatch(hl.dsp.focus({window = running_window, workspace = running_window.workspace}))
		else
			hl.dispatch(hl.dsp.focus({workspace = ws }))
			hl.dispatch(hl.dsp.exec_cmd(app))
		end
	end
end


M.screenshot = function()
  local cmd = "grimshot savecopy area ~/Pictures/IMG-$(date '+%Y-%m-%d-%H-%M-%S').png"
  hl.dispatch(hl.dsp.exec_cmd(cmd))
end


M.recordGif = function()
  local cmd = "~/personal/dotfiles/bin/record.sh"
  hl.dispatch(hl.dsp.exec_cmd(cmd))
end

return M
  
