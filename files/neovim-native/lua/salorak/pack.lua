local M = {}

M.gh = function(plugin)
	return "https://github.com/" .. plugin
end

M.srht = function(plugin)
	return "https://git.sr.ht/~" .. plugin
end

M.load_and_setup = function(plug)

	if plug.spec.data and plug.spec.data.disabled then
		return
	end

	local path = plug.path 
	vim.cmd("packadd! " .. plug.spec.name)

	if not plug.spec.data then
		return
	end

	local reqname = plug.spec.data.name
	local ok, plugin = pcall(require, reqname)

	if not ok then
		return
	end

	plugin.setup(plug.spec.data.opts)
end

return M
